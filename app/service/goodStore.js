const Service = require('egg').Service;
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const idGenerateUtil = require('@jianghujs/jianghu/app/common/idGenerateUtil');
const { tableEnum, goodTypeEnum } = require("../constant/constant");
const { BizError, errorInfoEnum } = require('../constant/error');
const _ = require('lodash');
const dayjs = require('dayjs');


const actionDataScheme = Object.freeze({

  storeGoodByPurchaseOrderGood: {
    type: 'object',
    additionalProperties: true,
    required: ['purchaseOrderGoodId','warehouseId', 'prepareStoreCount', 'operationUser', 'expirationAt'],
    properties: {
      purchaseOrderGoodId: { anyOf: [{ type: "string" }, { type: "number" }] },
      warehouseId: { anyOf: [{ type: "string" }, { type: "number" }] },
      // stockId: { anyOf: [{ type: "string" }, { type: "number" }] },
      prepareStoreCount:{ anyOf: [{ type: "string" }, { type: "number" }] },
      operationUser: { anyOf: [{ type: "string" }, { type: "number" }] },
      expirationAt: { type: "string" },
      remark: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },

  consumeOutWarehouse: {
    type: 'object',
    additionalProperties: true,
    required: ['consumeId', 'consumeOperationCount', 'consumeOperationUser'],
    properties: {
      consumeId: { anyOf: [{ type: "string" }, { type: "number" }] },
      consumeOperationCount: { anyOf: [{ type: "string" }, { type: "number" }] },
      consumeOperationUser: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },

  assetOperation: {
    type: 'object',
    additionalProperties: true,
    required: ['assetId', 'assetOperation', 'assetOperationUser'],
    properties: {
      assetId: { anyOf: [{ type: "string" }, { type: "number" }] },
      assetOperation: { type: "string", enum: ['领取', '归还'] },
      assetOperationUser: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class ItemService extends Service {

    async storeGoodByPurchaseOrderGood() {
      const actionData = this.ctx.request.body.appData.actionData;
      validateUtil.validate(actionDataScheme.storeGoodByPurchaseOrderGood, actionData);
      const { purchaseOrderGoodId, warehouseId, stockId, operationUser, expirationAt, remark } = actionData;
      const prepareStoreCount = parseInt(actionData.prepareStoreCount);
      const jianghuKnex = this.app.jianghuKnex;
      const purchaseOrderGood = await jianghuKnex(tableEnum.view01_purchase_order_good).where({ purchaseOrderGoodId }).select().first();
      if (!purchaseOrderGood) {
        throw new BizError(errorInfoEnum.data_exception);
      }
      if (purchaseOrderGood.goodCategory === goodTypeEnum.xiaohaopin || purchaseOrderGood.goodCategory === goodTypeEnum.yihaopin) {
        await this.storeConsumeByPurchaseOrderGood({ purchaseOrderGood, warehouseId, stockId, prepareStoreCount, operationUser, expirationAt, remark });
      }
      if (purchaseOrderGood.goodCategory === goodTypeEnum.yibanzican || purchaseOrderGood.goodCategory === goodTypeEnum.gudingzhican) {
        await this.storeAssetByPurchaseOrderGood({ purchaseOrderGood, warehouseId, stockId, prepareStoreCount, operationUser, expirationAt, remark });
      }
    }
    
    async storeConsumeByPurchaseOrderGood({ purchaseOrderGood, warehouseId, stockId, prepareStoreCount, operationUser, expirationAt, remark }) {
      const { knex } = this.app;
      const { goodId, purchaseOrderId, purchaseOrderGoodId, storeBatchCount } = purchaseOrderGood;
      const now = dayjs().format();

      let goodStore = await knex(tableEnum.good_store)
        .where({ goodId }).select().first();
      if (!goodStore) {
        goodStore = { goodId, storeCount: 0 }; 
        await knex(tableEnum.good_store).insert(goodStore);
      }
      if (goodStore.storeCount < 0) {
        throw new BizError(errorInfoEnum.data_exception);
      }

      const consumeId = `${purchaseOrderGoodId}-${ _.padStart(`${storeBatchCount + 1}`, 2, '0')}`;
      const consume = {
        consumeId, warehouseId, stockId, goodId,
        storeCountOfConsume: prepareStoreCount,
        purchaseOrderId, purchaseOrderGoodId,
        storeAt: now, expirationAt, remark,
      }
      const consumeHistory = {
        consumeId, warehouseId, stockId, goodId,
        consumeOperation: '入库', consumeOperationUser: operationUser, consumeOperationCount: prepareStoreCount, consumeOperationAt: now,
        purchaseOrderId, purchaseOrderGoodId,
        remark,
      }
      // Tip: 忽略--加减库存并发操作
      await knex.transaction(async trx => {
        // 库存表 更新
        await trx(tableEnum.good_store).where({ goodId }).increment({ storeCount: prepareStoreCount });
        await trx(tableEnum.good_consume).insert(consume);
        await trx(tableEnum.good_consume_history).insert(consumeHistory);

        // 采购商品入库信息 更新
        await trx(tableEnum.purchase_order_good).where({ purchaseOrderGoodId }).increment({
          storeCount: prepareStoreCount,
          storeBatchCount: 1,
        });
        const purchaseOrderGoodList = await trx(tableEnum.purchase_order_good).where({ purchaseOrderId }).select();
        const waittingStoreList = purchaseOrderGoodList.filter(item => item.goodCount > item.storeCount);
        if (waittingStoreList.length === 0) {
          await trx(tableEnum.purchase_order).where({ purchaseOrderId }).update({ isAllStore: '是' });
        }
      })
    }

    async storeAssetByPurchaseOrderGood({ purchaseOrderGood, warehouseId, stockId, prepareStoreCount, operationUser, expirationAt, remark }) {
      const { knex } = this.app;
      const { goodId, purchaseOrderId, purchaseOrderGoodId, storeBatchCount } = purchaseOrderGood;
      const now = dayjs().format();

      let goodStore = await knex(tableEnum.good_store)
        .where({ goodId }).select().first();
      if (!goodStore) {
        goodStore = { goodId, storeCount: 0 }; 
        await knex(tableEnum.good_store).insert(goodStore);
      }
      if (goodStore.storeCount < 0) {
        throw new BizError(errorInfoEnum.data_exception);
      }

      // TODO: idSequence ===>  
      // 固定:  13GY020171   16GY 020171
      // 一般:  13A0734067   16A 
      let idSequence = await idGenerateUtil.idPlus({
        knex: knex,
        tableName: tableEnum.good_asset,
        columnName: 'idSequence',
      });
      const assetList = [];
      const assetHistoryList = [];
      for (let i = 0; i < prepareStoreCount; i++) {
        const assetId = `ZC${idSequence}`;
        const asset = {
          idSequence, assetId, warehouseId, stockId, goodId,
          assetOperation: '入库', assetOperationUser: operationUser,
          purchaseOrderId, purchaseOrderGoodId,
          storeAt: now, expirationAt, remark,
        }
        const assetHistory = {
          assetId, warehouseId, stockId, goodId,
          assetOperation: '入库', assetOperationUser: operationUser, assetOperationAt: now,
          purchaseOrderId, purchaseOrderGoodId,
          remark,
        }
        assetList.push(asset);
        assetHistoryList.push(assetHistory);
        idSequence++;
      }

      // Tip: 忽略-加减库存并发操作
      await knex.transaction(async trx => {
        // 库存表 更新
        await trx(tableEnum.good_store).where({ goodId }).increment({ storeCount: prepareStoreCount });
        await trx(tableEnum.good_asset).insert(assetList);
        await trx(tableEnum.good_asset_history).insert(assetHistoryList);

        // 采购商品入库信息 更新
        await trx(tableEnum.purchase_order_good).where({ purchaseOrderGoodId }).increment({
          storeCount: prepareStoreCount,
          storeBatchCount: 1,
        });
        const purchaseOrderGoodList = await trx(tableEnum.purchase_order_good).where({ purchaseOrderId }).select();
        const waittingStoreList = purchaseOrderGoodList.filter(item => item.goodCount > item.storeCount);
        if (waittingStoreList.length === 0) {
          await trx(tableEnum.purchase_order).where({ purchaseOrderId }).update({ isAllStore: '是' });
        }
      })
    }
    

    async computeIsAllStoreForPurchaseOrder() {
      const jianghuKnex = this.app.jianghuKnex;

      const purchaseOrderList = await jianghuKnex(tableEnum.purchase_order).select();
      const purchaseOrderGoodList = await jianghuKnex(tableEnum.purchase_order_good).select();
      purchaseOrderList.forEach(purchaseOrder => {
        const orderGoodList = purchaseOrderGoodList.filter(orderGood => orderGood.purchaseOrderId === purchaseOrder.purchaseOrderId);
        const waittingStoreList = orderGoodList.filter(item => item.goodCount > item.storeCount);
        purchaseOrder.orderGoodList = orderGoodList;
        purchaseOrder.waittingStoreList = waittingStoreList;
      });

      const storedPurchaseOrderIdList = purchaseOrderList
        .filter(purchaseOrder => purchaseOrder.waittingStoreList.length === 0)
        .map(purchaseOrder => purchaseOrder.purchaseOrderId);
      const waittingStorePurchaseOrderIdList = purchaseOrderList
        .filter(purchaseOrder => purchaseOrder.waittingStoreList.length > 0)
        .map(purchaseOrder => purchaseOrder.purchaseOrderId);
      if (storedPurchaseOrderIdList.length > 0) {
        await jianghuKnex(tableEnum.purchase_order).whereIn('purchaseOrderId', storedPurchaseOrderIdList).update({ isAllStore: '是' });
      }  
      if (waittingStorePurchaseOrderIdList.length > 0) {
        await jianghuKnex(tableEnum.purchase_order).whereIn('purchaseOrderId', waittingStorePurchaseOrderIdList).update({ isAllStore: '否' });
      } 
    }


    async consumeOutWarehouse() {
      const actionData = this.ctx.request.body.appData.actionData;
      validateUtil.validate(actionDataScheme.consumeOutWarehouse, actionData);
      const { consumeId, consumeOperationUser, consumeOperationDeptId, remark } = actionData;
      const consumeOperationCount = parseInt(actionData.consumeOperationCount);
      const knex = this.app.knex;
      const now = dayjs().format();

      const goodConsume = await knex(tableEnum.good_consume)
        .where({ consumeId })
        .select()
        .first();
      const { goodId, warehouseId, stockId } = goodConsume;
      if (!goodConsume) {
        throw new BizError(errorInfoEnum.data_exception);
      }
      if (consumeOperationCount > goodConsume.storeCountOfConsume) {
        throw new BizError(errorInfoEnum.store_count_not_enough);
      }
      let goodStore = await knex(tableEnum.good_store)
        .where({ goodId })
        .select()
        .first();
      if (!goodStore) {
        throw new BizError(errorInfoEnum.data_exception);
      }

      const consumeHistory = {
        consumeId, warehouseId, stockId, goodId,
        consumeOperation: '出库', consumeOperationUser, consumeOperationCount, consumeOperationAt: now, consumeOperationDeptId, 
        remark
      }
      await knex.transaction(async trx => {
        await trx(tableEnum.good_store)
          .where({ goodId })
          .decrement({ storeCount: consumeOperationCount });
        await trx(tableEnum.good_consume)
          .where({ consumeId })
          .decrement({ storeCountOfConsume: consumeOperationCount });  
        await trx(tableEnum.good_consume_history).insert(consumeHistory);
      })
    }

    async assetOperation() {
      const actionData = this.ctx.request.body.appData.actionData;
      validateUtil.validate(actionDataScheme.assetOperation, actionData);
      const { assetId, assetOperation, assetOperationUser, assetOperationDeptId, remark } = actionData;
      let warehouseId = actionData.warehouseId;
      let stockId = actionData.stockId;
      const jianghuKnex = this.app.jianghuKnex;
      const ctx = this.ctx;
      const now = dayjs().format();

      let asset = await jianghuKnex(tableEnum.good_asset)
        .where({ assetId }).select().first();
      if (!asset) {
        throw new BizError(errorInfoEnum.data_exception);
      }
      if (assetOperation === '领取' && !(asset.assetOperation === '入库' || asset.assetOperation === '归还')) {
        throw new BizError({ errorCode: errorInfoEnum.data_exception.errorCode, errorReason: `领取失败, 当前资产状态为'${asset.assetOperation}'`});
      }
      if (assetOperation === '归还' && asset.assetOperation != '领取') {
        throw new BizError({ errorCode: errorInfoEnum.data_exception.errorCode, errorReason: `归还失败, 当前资产状态为'${asset.assetOperation}'`});
      }

      const { goodId } = asset;
      // 注意: 重要代码;
      //   如果操作时有填写仓库===> 则使用填写的库存
      //   如果操作时没有填写仓库===> 则使用默认的库存
      if (!warehouseId) {
        warehouseId = asset.warehouseId;
      }
      if (!stockId) {
        stockId = asset.stockId;
      }
      const assetHistory = {
        assetId, warehouseId, stockId, goodId, 
        assetOperation, assetOperationUser, assetOperationDeptId, assetOperationAt: now,
        remark,
      }
      await jianghuKnex.transaction(async trx => {
        await trx(tableEnum.good_asset, ctx).where({ assetId }).update({ warehouseId, stockId, assetOperation, assetOperationUser, assetOperationDeptId, remark });
        await trx(tableEnum.good_asset_history).insert(assetHistory);
      })
    }
    
    
}

module.exports = ItemService;