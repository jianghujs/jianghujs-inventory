'use strict';
const Service = require('egg').Service;
const _ = require('lodash');
const { tableEnum } = require("../constant/constant");
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const { BizError, errorInfoEnum } = require("../constant/error");
const dayjs = require('dayjs');

class PurchaseService extends Service {
  async savePurchaseOrderDraft() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const { userId, username } = this.ctx.userInfo;
    const { purchaseTitle, goodList, workflowId, workflowConfigCustom, remark, purchaseDeptId, purchaseDeptName } = actionData;
    
    const idSequence = await idGenerateUtil.idPlus({
      knex: jianghuKnex,
      startValue: 10001,
      tableName: tableEnum.purchase_order,
      columnName: "idSequence"
    });
    const purchaseOrderId = `CG${idSequence}`;

    await jianghuKnex.transaction(async trx => {
      // 创建采购单
      let purchaseOrder = {
        idSequence,
        purchaseOrderId,
        purchaseTitle, 
        purchaseRequirerId: userId,
        purchaseRequirerName: username,
        purchaseStatus: '草稿',
        remark: remark,
        workflowId: workflowId,
        purchaseDeptId,
        purchaseDeptName,
        workflowConfigCustom
      }
      await trx(tableEnum.purchase_order, this.ctx).insert(purchaseOrder);

      let index = 0;
      let purchaseOrderGoodList = goodList.map(good => {
        index++;
        const subfix = _.padStart(`${index}`, 2, '0');
        return {
          purchaseOrderGoodId: `${purchaseOrderId}-${subfix}`,
          purchaseOrderId: purchaseOrderId,
          goodId: good.goodId,
          goodName: good.goodName,
          goodUnit: good.goodUnit,
          goodPrice: good.goodPrice,
          goodCount: good.goodCount,
          remark: '',
        } 
      });
      await trx(tableEnum.purchase_order_good, this.ctx).insert(purchaseOrderGoodList);
    })
    return purchaseOrderId;
  }
  async submitPurchaseOrder() {
    const { jianghuKnex } = this.app;
    let { purchaseOrderId } = this.ctx.request.body.appData.actionData;
    await jianghuKnex.transaction(async trx => {
      if(purchaseOrderId) {
        await this.updatePurchaseOrderDraft();
      } else {
        purchaseOrderId = await this.savePurchaseOrderDraft();
      }
      await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).update({purchaseStatus: '采购询价'});
    })
  }
  async updatePurchaseOrderDraft() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const { purchaseOrderId, purchaseTitle, 
        goodList, workflowId, 
        purchaseDeptId, purchaseDeptName, 
        remark,
        workflowConfigCustom } = actionData;
    await jianghuKnex.transaction(async trx => {
      // 更新采购单
      let purchaseOrder = {
        purchaseTitle, 
        remark: remark,
        workflowId: workflowId,
        purchaseDeptId, purchaseDeptName,
        workflowConfigCustom
      }
      await trx(tableEnum.purchase_order, this.ctx).where({purchaseOrderId: purchaseOrderId}).update(purchaseOrder);
      // 删除采购商品 
      await trx(tableEnum.purchase_order_good, this.ctx).where({purchaseOrderId: purchaseOrderId}).delete();
      // 保存采购商品
      let purchaseOrderGoodList = goodList.map(good => {
        return {
          purchaseOrderId: purchaseOrderId,
          goodId: good.goodId,
          goodName: good.goodName,
          goodUnit: good.goodUnit,
          goodPrice: good.goodPrice,
          goodCount: good.goodCount,
          remark: '',
        }
      });
      await trx(tableEnum.purchase_order_good, this.ctx).insert(purchaseOrderGoodList);
    })
  }

  async updatePurchaseOrderInfo() {
    const { actionData, where } = this.ctx.request.body.appData;
    const { jianghuKnex, config } = this.app;
    const {
      purchaseDeptId,
      purchaseDeptName,
      purchaseTitle,
      remark,
      workflowId,
      workflowConfigCustom
    } = actionData;

    
    await jianghuKnex(tableEnum.purchase_order, this.ctx).where({ id: where.id }).update({
      purchaseDeptId,
      purchaseDeptName,
      purchaseTitle,
      remark,
      workflowId,
      workflowConfigCustom,
    });
  }

  // 获取最近的部门预算列表
  async _getLatestDeptBudgetList(deptId, finishAt) {
    const { jianghuKnex, knex } = this.app;
    finishAt = finishAt ? dayjs(finishAt).format("YYYY-MM-DD") : dayjs().format("YYYY-MM-DD");

    return await knex(tableEnum.budget_dept)
    .where({ deptId, rowStatus: '正常' })
    .andWhere(
      'budgetEndDate', '>=', finishAt
    )
    .andWhere(
      'budgetStartDate', '<', finishAt
    )
    .select()
  }

  // 获取最近的商品预算列表
  async _getLatestGoodBudgetList(goodId, finishAt) {
    const { jianghuKnex, knex } = this.app;
    finishAt = finishAt ? dayjs(finishAt).format("YYYY-MM-DD") : dayjs().format("YYYY-MM-DD");

    return await knex(tableEnum.budget_good)
    .where({ goodId, rowStatus: '正常' })
    .andWhere(
      'budgetEndDate', '>=', finishAt
    )
    .andWhere(
      'budgetStartDate', '<=', finishAt
    )
    .select()
  }

  

  // 更新已使用的部门预算
  async _updateUsedDeptBudget(purchaseOrderId, deptId, purchaseOrderFinishAt) {
    const { jianghuKnex, knex } = this.app;
    //查采购订单的所有商品
    const purchaseOrderGoods = await jianghuKnex(tableEnum.purchase_order_good, this.ctx).where({ purchaseOrderId }).select();
    const used = purchaseOrderGoods.reduce((prev, next)=> prev + (next.goodPrice * next.goodCount), 0)

    //获取第一个部门预算
    const deptBudgetList = await this._getLatestDeptBudgetList(deptId, purchaseOrderFinishAt)

    //更新所有在时间段内的部门预算
    deptBudgetList.forEach(async item=> {
      await knex(tableEnum.budget_dept).where({ budgetId: item.budgetId }).increment({
        usedBudgetPrice: used
      })
    })
  }

  // 更新已使用的商品预算
  async _updateUsedGoodBudget(purchaseOrderId, purchaseOrderFinishAt) {
    const { jianghuKnex, knex } = this.app;
    //查采购订单的所有商品
    const purchaseOrderGoods = await jianghuKnex(tableEnum.purchase_order_good, this.ctx).where({ purchaseOrderId }).select();
    purchaseOrderGoods.forEach(async purchaseOrderGood => {
      console.log('purchaseOrderGood', purchaseOrderGood)
      const goodBudgetList = await this._getLatestGoodBudgetList(purchaseOrderGood.goodId, purchaseOrderFinishAt);
      
      console.log(goodBudgetList)
      //更新所有在时间段内的商品预算
      goodBudgetList.forEach(async goodBudget => {
        await knex(tableEnum.budget_good).where({ budgetId: goodBudget.budgetId }).increment({
          usedBudgetPrice: purchaseOrderGood.goodPrice * purchaseOrderGood.goodCount
        })
      })
    })
  }

  async updatePurchaseOrderStatus() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    const { purchaseOrderId, purchaseStatus } = actionData;
    let purchaseOrder = await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).first();
    let updateItem = { purchaseStatus }
    if(!purchaseOrder) {
      throw new BizError(errorInfoEnum.purchaseOrderNotExist);
    }
    if(purchaseStatus === '采购完成') {
      updateItem.finishAt = dayjs().format();
      await this._updateUsedDeptBudget(purchaseOrderId, purchaseOrder.purchaseDeptId, updateItem.finishAt)
      await this._updateUsedGoodBudget(purchaseOrderId, updateItem.finishAt)
    }
    await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId: purchaseOrderId}).update(updateItem);
  }

  async appendPurchaseOrderGoodList() {
    const { resultData } = this.ctx.response.body.appData;
    const { jianghuKnex } = this.app;
    for(let i = 0; i < resultData.rows.length; i++) {
      let row = resultData.rows[i];
      let goodList = await jianghuKnex(tableEnum.view01_purchase_order_good, this.ctx).where({ purchaseOrderId: row.purchaseOrderId }).select();
      row.goodList = goodList || [];
    }
  }

  async deletePurchaseOrderGoodList() {
    const { purchaseOrderId } = this.ctx.request.body.appData.where;
    const { jianghuKnex } = this.app;
    if(purchaseOrderId) {
      await jianghuKnex(tableEnum.purchase_order_good, this.ctx).where({purchaseOrderId}).delete();
    }
  }
  
  async createWorkflowTask() {
    const { actionData } = this.ctx.request.body.appData;
    const { jianghuKnex } = this.app;
    const { purchaseOrderId } = actionData;
    const { userId, username } = this.ctx.userInfo;
    let purchaseOrder = await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).first();
    if(!purchaseOrder) {
      throw new BizError(errorInfoEnum.purchase_order_not_found);
    }
    let workflow = await jianghuKnex(tableEnum.workflow, this.ctx).where({workflowId: purchaseOrder.workflowId}).first();
    if(!workflow) {
      throw new BizError(errorInfoEnum.workflow_not_found);
    }
    
    actionData.workflowConfigCustom = purchaseOrder.workflowConfigCustom;
    actionData.workflowId = workflow.workflowId;
    actionData.taskTitle = `[${purchaseOrder.purchaseOrderId}]${purchaseOrder.purchaseTitle}`;
    actionData.workflowForm = [];
    actionData.workflowFormData = {};
    let workflowTask = await this.ctx.service.task.createTask()
    await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).update({
      workflowTaskId: workflowTask.taskId,
      purchasePurchaserId: userId,
      purchasePurchaserName: username,
      purchaseStatus: '审核中',
      applyAt: dayjs().format(),
    });
  }

  async executeApprovalrFinish(actionData) {
    const { jianghuKnex } = this.app;
    const { taskId } = actionData;
    let purchaseOrder = await jianghuKnex(tableEnum.purchase_order, this.ctx).where({workflowTaskId: taskId}).first();
    if(purchaseOrder) {
      let taskHistoryList = await jianghuKnex(tableEnum.task_history, this.ctx).where({taskId}).select();
      await jianghuKnex(tableEnum.purchase_order, this.ctx).where({workflowTaskId: taskId}).update({
        purchaseStatus: '采购中',
        purchaseApprovalrId1: taskHistoryList.length > 0? taskHistoryList[0].operationByUserId: null,
        purchaseApprovalrName1: taskHistoryList.length > 0? taskHistoryList[0].operationByUser: null,
        purchaseApprovalrId2: taskHistoryList.length > 1? taskHistoryList[1].operationByUserId: null,
        purchaseApprovalrName2: taskHistoryList.length > 1? taskHistoryList[1].operationByUser: null,
        purchaseApprovalrId3: taskHistoryList.length > 2? taskHistoryList[2].operationByUserId: null,
        purchaseApprovalrName3: taskHistoryList.length > 2? taskHistoryList[2].operationByUser: null
      });
    }
  }

  async executeApprovalrReject(actionData) {
    const { jianghuKnex } = this.app;
    const { taskId } = actionData;
    let purchaseOrder = await jianghuKnex(tableEnum.purchase_order, this.ctx).where({workflowTaskId: taskId}).first();
    if(purchaseOrder) {
      await jianghuKnex(tableEnum.purchase_order, this.ctx).where({workflowTaskId: taskId}).update({
        purchaseStatus: '审核失败'
      });
    }
  }

  async updatePurchaseOrderGoodSupplierAndPrice(actionData) {
    const { jianghuKnex } = this.app;
    const { userId, username } = this.ctx.userInfo;
    const { purchaseOrderId, goodId, supplierId, goodPrice, purchaseOrderPrice } = actionData;
    let purchaseOrder = await jianghuKnex(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).first();
    if(!purchaseOrder) {
      throw new BizError(errorInfoEnum.purchase_order_not_found);
    }
    
    await jianghuKnex.transaction(async trx => {
      await trx(tableEnum.purchase_order_good, this.ctx).where({purchaseOrderId, goodId}).update({ 
        supplierId, goodPrice,
        filledByUserId: userId, filledByUser: username
      });
      await trx(tableEnum.purchase_order, this.ctx).where({purchaseOrderId}).update({ purchaseOrderPrice });
      await trx(tableEnum.supplier_good, this.ctx).where({supplierId, goodId}).update({
        goodPriceRecent: goodPrice
      });
      await trx(tableEnum.supplier_good_price_history, this.ctx).insert({
        supplierId,
        goodId: goodId,
        goodPrice: goodPrice
      });
    });
  }

  async getPurchaseOrderDetail() {
    const { jianghuKnex, knex } = this.app;
    const { actionData } = this.ctx.request.body.appData;
    const { purchaseOrderId, workflowTaskId } = actionData;
    // 获取采购单基础信息
    let purchaseOrder = await jianghuKnex(tableEnum.view01_purchase_order, this.ctx).where(purchaseOrderId? {purchaseOrderId}: {workflowTaskId}).first();
    if(!purchaseOrder) {
      throw new BizError(errorInfoEnum.purchase_order_not_found);
    }
    const finishAtDay = purchaseOrder.finishAt ? dayjs(purchaseOrder.finishAt).format("YYYY-MM-DD") : dayjs().format("YYYY-MM-DD");

    const [taskInfo, goodList, contractList] = await Promise.all([
      // 获取审批任务信息
      jianghuKnex(tableEnum.task, this.ctx).where({taskId: purchaseOrder.workflowTaskId}).first(),
      // 获取采购单商品信息
      jianghuKnex(tableEnum.view01_purchase_order_good, this.ctx).where({purchaseOrderId: purchaseOrder.purchaseOrderId}).select(),
      // 获取凭据列表
      jianghuKnex(tableEnum.purchase_order_contract, this.ctx).where({purchaseOrderId: purchaseOrder.purchaseOrderId, rowStatus: '正常' }).select()
    ])

    //获取部门的预算
    const budgetDeptList = await jianghuKnex(tableEnum.budget_dept, this.ctx)
      .where({ rowStatus: '正常', deptId: purchaseOrder.purchaseDeptId})
      .andWhere(
        'budgetEndDate', '>=', finishAtDay
      )
      .andWhere(
        'budgetStartDate', '<', finishAtDay
      )
      .select();
    
    //获取商品的预算
    await Promise.all(goodList.map(async good => {
      const budgetGood = await jianghuKnex(tableEnum.budget_good, this.ctx)
      .where({goodId: good.goodId})
      .andWhere(
        'budgetEndDate', '>=', finishAtDay
      )
      .andWhere(
        'budgetStartDate', '<=', finishAtDay
      )
      .first();
      if(budgetGood) {
        good.budgetPrice = budgetGood.budgetPrice
        good.usedBudgetPrice = budgetGood.usedBudgetPrice
        good.budgetStartDate = budgetGood.budgetStartDate
        good.budgetEndDate = budgetGood.budgetEndDate
      }
    }))
  
    if(taskInfo) {
      purchaseOrder.taskInfo = taskInfo;
    }
    
    purchaseOrder.goodList = goodList || [];
    
    purchaseOrder.contractList = contractList || [];

    if (budgetDeptList.length > 0) {
      purchaseOrder.budgetDept = budgetDeptList
    }
    
    return purchaseOrder;
  }

  // 获取当前用户所在的部门
  async getCurrentUserDept() {
    const { userId, username } = this.ctx.userInfo;
    const { jianghuKnex } = this.app;
    const userDeptInfo = await jianghuKnex(tableEnum.view01_user_dept).where({ userId }).first()

    return userDeptInfo
  }
}

module.exports = PurchaseService;
