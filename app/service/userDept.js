'use strict';

// ========================================常用 require start===========================================
const Service = require('egg').Service;
const { tableEnum } = require('../constant/constant');
const { BizError, errorInfoEnum } = require('../constant/error');
const validateUtil = require('@jianghujs/jianghu/app/common/validateUtil');

const actionDataScheme = Object.freeze({
  verifyUserDept: {
    type: 'object',
    additionalProperties: true,
    required: [ 'userId', 'roleName', 'deptId' ],
    properties: {
      userId: { type: 'string' },
      roleName: { type: 'string' },
      deptId: { type: 'string' },
    },
  }
});


class UserDeptService extends Service {

  async _getUserDeptDetail(userId) {
    const { jianghuKnex } = this.app;
    const rows = await jianghuKnex(tableEnum.user_dept, this.ctx).where({ userId }).select();
    return rows.length ? rows[0] : null
  }

  // 一个用户只能在一个部门，这里做校验
  async verifyUserDept() {
    const { jianghuKnex } = this.app;
    const actionData = this.ctx.request.body.appData.actionData;
    validateUtil.validate(actionDataScheme.verifyUserDept, actionData, '部门用户生成');

    const exist = await this._getUserDeptDetail(actionData.userId)
    if (exist) {
      const { errorCode, errorReason } = errorInfoEnum.user_dept_exist;

      throw new BizError({ errorCode, errorReason });
    }
  }

  // 一个用户只能在一个部门，这里做校验
  async verifyUserDeptForUpdate() {
    const { jianghuKnex } = this.app;
    const actionData = this.ctx.request.body.appData.actionData;
    const { id } = this.ctx.request.body.appData.where;
    validateUtil.validate(actionDataScheme.verifyUserDept, actionData, '部门用户生成');

    const exist = await this._getUserDeptDetail(actionData.userId)
    if (exist && exist.id !== id) {
      const { errorCode, errorReason } = errorInfoEnum.user_dept_exist;

      throw new BizError({ errorCode, errorReason });
    }
  }

}

module.exports = UserDeptService;
