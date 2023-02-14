const Service = require('egg').Service;
const idGenerateUtil = require("@jianghujs/jianghu/app/common/idGenerateUtil");
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');

const actionDataScheme = Object.freeze({
  fillInsertItemParamsBeforeHook: {
    type: 'object',
    additionalProperties: true,
    required: [ 'type', 'bizId', 'tableName' ],
    properties: {
      type: { type: 'string', enum: [ 'idSequence' ] },
      bizId: { anyOf: [{ type: "string" }, { type: "number" }] },
      tableName: { anyOf: [{ type: "string" }, { type: "number" }] },
      prefix: { anyOf: [{ type: "string" }, { type: "number" }, { type: "null" }] },
    },
  },
});

class CommonService extends Service {
  async goodIdPlus({goodCategory, plusValue=1}) {
    const startValueConfig = {'消耗品': 10001, '易耗品': 20001, '一般资产': 30001, '固定资产': 40001};
    const maxBizIdResult = await this.app.jianghuKnex('good')
    .where({goodCategory}) .max('idSequence', { as: "maxBizId", }) .first();
    if (!maxBizIdResult.maxBizId) {
      return startValueConfig[goodCategory];
    } else {
      return parseInt(maxBizIdResult.maxBizId) + plusValue;
    }
  }
  /**
   * 商品ID生成
   * 消耗品 10001++
   * 易耗品 20001++
   * 一般资产 30001++
   * 固定资产 40001++
   */
  async fillGoodIdBeforeHook() {
    const { goodCategory } = this.ctx.request.body.appData.actionData;
    const idSequence = await this.goodIdPlus({ goodCategory });
    const bizIdValue = 'SP' + idSequence;
    this.ctx.request.body.appData.actionData.idSequence = idSequence;
    this.ctx.request.body.appData.actionData.goodId = bizIdValue;
  }

  async fillInsertItemParamsBeforeHook() {
    const idGenerate = this.ctx.request.body.appData.idGenerate;
    validateUtil.validate(actionDataScheme.fillInsertItemParamsBeforeHook, idGenerate, "ID生成");
    const { type, bizId, tableName } = idGenerate;
    const prefix = idGenerate.prefix || '';

    if (type === 'idSequence') {
      const idSequence = await idGenerateUtil.idPlus({
        knex: this.app.jianghuKnex,
        tableName,
        columnName: 'idSequence',
      });
      const bizIdValue = prefix+ idSequence;
      this.ctx.request.body.appData.actionData.idSequence = idSequence;
      this.ctx.request.body.appData.actionData[bizId] = bizIdValue;
    }
  }
  

}

module.exports = CommonService;