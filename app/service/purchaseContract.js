const Service = require('egg').Service;
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');
const { tableEnum } = require("../constant/constant");
const _ = require('lodash');

const actionDataScheme = Object.freeze({
  fillInsertItemParamsBeforeHook: {
    type: 'object',
    additionalProperties: true,
    required: [ 'purchaseOrderId' ],
    properties: {
      purchaseOrderId: { anyOf: [{ type: "string" }, { type: "number" }] },
    },
  },
});

class PurchaseContractService extends Service {

  async fillInsertItemParamsBeforeHook() {
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.fillInsertItemParamsBeforeHook, actionData);
    const jianghuKnex = this.app.jianghuKnex;
    const { purchaseOrderId } = actionData;
    const purchaseOrderContractList = await jianghuKnex(tableEnum.purchase_order_contract).where({ purchaseOrderId }).select();
    const idSubfix= _.padStart(`${purchaseOrderContractList.length}`, 3, '0');
    this.ctx.request.body.appData.actionData.contractId = `${purchaseOrderId}-${idSubfix}`;
  }

}

module.exports = PurchaseContractService;