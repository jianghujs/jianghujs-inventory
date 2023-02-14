'use strict';

module.exports = {
  tableEnum: {
    // ========================江湖表============================
    _cache: '_cache',
    _constant: '_constant',
    _file: '_file',
    _group: '_group',
    _log: '_log',
    _page: '_page',
    _resource: '_resource',
    _record_history: '_record_history',
    _resource_request_log: '_resource_request_log',
    _role: '_role',
    _test_case: '_test_case',
    _user: '_user',
    _user_group_role: '_user_group_role',
    _user_group_role_page: '_user_group_role_page',
    _user_group_role_resource: '_user_group_role_resource',
    _user_group_role_ui_level: '_user_group_role_ui_level',
    _user_session: '_user_session',
    // ========================应用表============================
    app: 'purchase',
    purchase_order: 'purchase_order',
    purchase_order_good: 'purchase_order_good',
    purchase_order_contract: 'purchase_order_contract',
    workflow: 'workflow',
    task: 'task',
    task_history: 'task_history',

    user_dept: 'user_dept',
    budget_dept: 'budget_dept',
    budget_good: 'budget_good',

    item: 'item',
    item_asset: 'item_asset',
    item_asset_history: 'item_asset_history',
    item_consume: 'item_consume',
    item_consume_history: 'item_consume_history',
    stock: 'stock',
    warehouse: 'warehouse',

    good_store: 'good_store',
    good_consume: 'good_consume',
    good_consume_history: 'good_consume_history',
    good_asset: 'good_asset',
    good_asset_history: 'good_asset_history',
    // ========================其他库============================
    supplier_good: 'fs_wms_basic.supplier_good',
    supplier_good_price_history: 'fs_wms_basic.supplier_good_price_history',
    budget_dept: 'fs_wms_basic.budget_dept',
    budget_good: 'fs_wms_basic.budget_good',
    user_dept: 'fs_wms_basic.user_dept',
    // ========================高级 View============================
    view01_purchase_order: 'view01_purchase_order',
    view01_purchase_order_good: 'view01_purchase_order_good',
    view01_user_dept: 'view01_user_dept',
    _view01_user: '_view01_user',
    // ========================高级 View============================
  },
  goodTypeEnum: {
    xiaohaopin: '消耗品',
    yihaopin: '易耗品',
    gudingzhican: '固定资产',
    yibanzican: '一般资产',
  }
};


