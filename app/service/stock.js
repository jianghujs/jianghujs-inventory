const Service = require('egg').Service;
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { tableEnum } = require('../constant/constant');
const _ = require('lodash');

const actionDataScheme = Object.freeze({
  fillInsertItemParamsBeforeHook: {
    type: 'object',
    additionalProperties: true,
    required: [ 'warehouseId' ],
    properties: {
      warehouseId: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class CommonService extends Service {

  async fillInsertItemParamsBeforeHook() {
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.fillInsertItemParamsBeforeHook, actionData);
    const { warehouseId } = actionData;
    const knex = this.app.knex;
    const result = await knex(tableEnum.stock)
      .where({ warehouseId })
      .select(knex.raw('MAX(stockId) as maxStockId'));
    const maxStockId = result[0].maxStockId || `${warehouseId}-000`;
    const targetPathId = maxStockId.split('-')[1];
    const newPathId = parseInt(targetPathId) + 1;
    const stockId =  warehouseId + '-' + _.padStart(newPathId, 3, '0');
    this.ctx.request.body.appData.actionData.stockId = stockId;
  }

}

module.exports = CommonService;