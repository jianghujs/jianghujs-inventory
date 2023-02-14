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
  async appendWhereByOprationByUserId() {
    const { userId, username } = this.ctx.userInfo;
    const { where } = this.ctx.request.body.appData;
    where.operationByUserId = userId;
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
  async fillSelectItemListParamsBeforeHook() {
    const { rowStatus = '正常' } = this.ctx.request.body.appData.where
    Object.assign(this.ctx.request.body.appData.where, {
      rowStatus
    })
  }

}

module.exports = CommonService;