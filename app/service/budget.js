'use strict';

const Service = require('egg').Service;
const _ = require('lodash');
const { tableEnum } = require('../constant/constant');
const { BizError, errorInfoEnum } = require('../constant/error');


class BudgetService extends Service {

  async recomputeUsedBudgetPriceForDept() {
    const { jianghuKnex, knex } = this.app;

    const deptBudgetList = await jianghuKnex(tableEnum.budget_dept).where({
      rowStatus: '正常'
    }).select();

    for (let i = 0; i < deptBudgetList.length; i++) {
      const deptBudget = deptBudgetList[i];
      const purchaseOrderGoodList = await knex(tableEnum.view01_purchase_order_good)
        .where({ purchaseDeptId: deptBudget.deptId, purchaseStatus: '采购完成' })
        .andWhere('finishAt', '>=', deptBudget.budgetStartDate)
        .andWhere('finishAt', '<=', deptBudget.budgetEndDate)
        .select();  
      const usedBudgetPrice = _.sumBy(purchaseOrderGoodList, function(o) { return (o.goodPrice || 0) * o.goodCount; });
      await knex(tableEnum.budget_dept, this.ctx)
        .where({ budgetId: deptBudget.budgetId })
        .update({ usedBudgetPrice });
    }
  }


  async recomputeUsedBudgetPriceForGood() {
    const { jianghuKnex, knex } = this.app;

    const goodBudgetList = await jianghuKnex(tableEnum.budget_good).where({
      rowStatus: '正常'
    }).select();

    for (let i = 0; i < goodBudgetList.length; i++) {
      const goodBudget = goodBudgetList[i];
      const purchaseOrderGoodList = await knex(tableEnum.view01_purchase_order_good)
        .where({ goodId: goodBudget.goodId, purchaseStatus: '采购完成' })
        .andWhere('finishAt', '>=', goodBudget.budgetStartDate)
        .andWhere('finishAt', '<=', goodBudget.budgetEndDate)
        .select();  
      const usedBudgetPrice = _.sumBy(purchaseOrderGoodList, function(o) { return (o.goodPrice || 0) * o.goodCount; });
      await knex(tableEnum.budget_good, this.ctx)
        .where({ budgetId: goodBudget.budgetId })
        .update({ usedBudgetPrice });
    }
  }

}

module.exports = BudgetService;
