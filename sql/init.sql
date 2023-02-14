# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户Id',
  `content` longtext COMMENT '缓存数据',
  `recordStatus` varchar(255) DEFAULT 'active',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '缓存表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) DEFAULT NULL,
  `constantType` varchar(255) DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `constantValue` text COMMENT '常量内容; object, array',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '常量表; 软删除未启用;';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 COMMENT = '群组表; 软删除未启用;';



INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'adminGroup',NULL,NULL,NULL,'{}','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'pageId',
  `pageName` varchar(255) DEFAULT NULL COMMENT 'page name',
  `pageFile` varchar(255) DEFAULT NULL COMMENT 'page文件指定; 默认使用pageId.html',
  `pageType` varchar(255) DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 COMMENT = '页面表; 软删除未启用;';



INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','帮助','helpV3','dynamicInMenu','11','insert',NULL,NULL,NULL),(3,'login','登陆','loginV3','','','insert',NULL,NULL,NULL),(5,'manual',' 操作手册',NULL,'dynamicInMenu','1','insert',NULL,NULL,NULL),(10,'workflowManagement','采购流程配置',NULL,'showInMenu','1','update','vscode','vscode','2022-10-08T09:35:35+08:00'),(11,'workflowEditor','流程编辑',NULL,'dynamicInMenu','1','insert',NULL,NULL,NULL),(12,'purchaseOrderApply','采购申请',NULL,'showInMenu','2','insert',NULL,NULL,NULL),(13,'purchaseOrderManagement','采购单管理',NULL,'showInMenu','3','insert',NULL,NULL,NULL),(15,'taskCreateManagement','采购流程申请',NULL,'dynamicInMenu','4','update','vscode','vscode','2022-10-08T09:48:22+08:00'),(16,'taskICreateManagement','采购审批',NULL,'showInMenu','4','update','vscode','vscode','2022-10-08T09:42:17+08:00'),(19,'purchaseOrderContract','凭据查看',NULL,'showInMenu','5','insert',NULL,NULL,NULL),(31,'purchaseOrderDetail','采购详情',NULL,'dynamicInMenu',NULL,'insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _record_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` text NOT NULL COMMENT '数据JSON',
  `packageContent` text NOT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`, `operation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 496 COMMENT = '数据历史表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COMMENT 'appData 参数校验',
  `resourceData` text COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COMMENT '请求Demo',
  `responseDemo` text COMMENT '响应Demo',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 383 ROW_FORMAT = DYNAMIC COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';



INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,NULL,NULL,'login','passwordLogin','✅登陆','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }','','','insert',NULL,NULL,NULL),(2,NULL,NULL,'allPage','logout','✅登出','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"logout\" }','','','insert',NULL,NULL,NULL),(3,NULL,NULL,'allPage','userInfo','✅获取用户信息','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }','','','insert',NULL,NULL,NULL),(4,NULL,NULL,'allPage','getConstantList','✅查询常量','sql','{}','{ \"table\": \"_constant\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(231,NULL,NULL,'workflowManagement','selectItemList','✅workflowManagement查询-查询列表','sql','{}','{\"table\": \"workflow\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL),(232,NULL,'{\"before\":[{\"service\":\"workflow\",\"serviceFunction\":\"createWorkflowId\"}]}','workflowManagement','insertItem','✅workflowManagement查询-添加成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL),(233,NULL,NULL,'workflowManagement','updateItem','✅workflowManagement查询-更新成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL),(234,NULL,NULL,'workflowManagement','deleteItem','✅workflowManagement查询-删除信息','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL),(235,NULL,'','workflowManagement','selectUserList','✅查询-用户列表','sql',NULL,'{\"table\": \"_view01_user\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00'),(236,NULL,'','workflowManagement','selectGroupList','✅查询-组列表','sql',NULL,'{\"table\": \"_group\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00'),(241,NULL,NULL,'taskCreateManagement','selectWorkflowList','✅获取流程列表','sql',NULL,'{\"table\": \"workflow\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00'),(242,NULL,'{}','taskCreateManagement','insertItem','✅新增任务','service',NULL,'{\"service\":\"task\",\"serviceFunction\":\"createTask\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00'),(251,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"whereToViewUserId\"}]}','taskICreateManagement','selectItemList','✅查询-查询列表','sql','{}','{\"table\": \"view01_task\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-02T22:48:31+08:00'),(252,NULL,'','taskHistoryManagement','getTaskHistoryInfo','✅获取任务历史详情','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"getTaskHistoryInfo\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00'),(253,NULL,'','taskHistoryManagement','submitNode','✅节点流转','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"submitNode\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00'),(333,NULL,NULL,'purchaseOrderDetail','getPurchaseOrderDetail','✅获取采购订单详情','service','{}','{\"service\":\"purchase\",\"serviceFunction\":\"getPurchaseOrderDetail\"}','','','insert',NULL,NULL,NULL),(339,NULL,NULL,'allPage','uploadFileDone','✅ 文件分片上传-所有分片上传完毕','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileDone\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00'),(340,NULL,NULL,'allPage','httpUploadByStream','✅ 文件分片上传-http文件流','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00'),(346,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"historyFilterHook\"}]}','taskICreateManagement','selectTaskHistoryList','✅查询列表','sql','{}','{ \"table\": \"task_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(348,NULL,'','purchaseOrderApply','selectItemList','✅查询列表','sql','{}','{ \"table\": \"purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(349,NULL,NULL,'purchaseOrderApply','selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(350,NULL,NULL,'purchaseOrderApply','savePurchaseOrderDraft','✅保存草稿','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"savePurchaseOrderDraft\" }','','','insert',NULL,NULL,NULL),(351,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderDraft','✅更新','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderDraft\" }','','','insert',NULL,NULL,NULL),(352,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"deletePurchaseOrderGoodList\"}]}','purchaseOrderApply','deleteItem','✅删除','sql','{}','{ \"table\": \"purchase_order\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL),(353,NULL,NULL,'purchaseOrderApply','goodSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(354,NULL,NULL,'purchaseOrderApply','submitPurchaseOrder','✅提交','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"submitPurchaseOrder\" }','','','insert',NULL,NULL,NULL),(355,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderStatus','✅更新采购单状态','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderStatus\" }','','','insert',NULL,NULL,NULL),(356,NULL,NULL,'purchaseOrderApply','selectWorkflowList','✅查询审核流程列表','sql','{}','{ \"table\": \"workflow\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(357,NULL,NULL,'purchaseOrderApply','selectDeptList','✅查询部门列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(361,NULL,'','purchaseOrderManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(362,NULL,NULL,'purchaseOrderManagement','goodSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(363,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"appendPurchaseOrderGoodList\"}]}','purchaseOrderManagement','supplierSelect-getSupplierList','✅supplierSelect-查询商品供应商列表','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(364,NULL,'','purchaseOrderManagement','supplierSelect-updateItem','✅supplierSelect-更新成员','service','{}','{\"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderGoodSupplierAndPrice\"}','','','insert',NULL,NULL,NULL),(365,NULL,'','purchaseOrderManagement','createWorkflowTask','✅生成工作流任务','service','{}','{\"service\":\"purchase\",\"serviceFunction\":\"createWorkflowTask\"}','','','insert',NULL,NULL,NULL),(366,NULL,NULL,'purchaseOrderManagement','supplierSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(367,NULL,NULL,'purchaseOrderManagement','selectSupplierGoodList','✅查询供应商商品','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(368,NULL,NULL,'purchaseOrderManagement','updatePurchaseOrderStatus','✅更新采购单状态','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderStatus\" }','','','insert',NULL,NULL,NULL),(371,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"appendPurchaseOrderGoodList\"}]}','purchaseOrderContract','selectItemList','✅查询列表','sql','{}','{ \"table\": \"purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(373,NULL,NULL,'purchaseOrderManagement','contractUpload-selectItemList','✅purchaseOrderContractManagement查询-查询列表','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(374,NULL,'{\"before\":[{\"service\":\"purchaseContract\",\"serviceFunction\":\"fillInsertItemParamsBeforeHook\"}]}','purchaseOrderManagement','contractUpload-insertItem','✅purchaseOrderContractManagement查询-添加成员','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL),(375,NULL,NULL,'purchaseOrderManagement','contractUpload-updateItem','✅purchaseOrderContractManagement查询-更新成员','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL),(376,NULL,NULL,'purchaseOrderManagement','contractUpload-deleteItem','✅purchaseOrderContractManagement查询-删除信息','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL),(377,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderInfo','✅更新采购单信息','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderInfo\" }','','','insert',NULL,NULL,NULL),(378,NULL,NULL,'purchaseOrderManagement','selectPurchaseOrderGoodList','✅查询采购单商品列表','sql','{}','{ \"table\": \"view01_purchase_order_good_store\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(379,NULL,NULL,'purchaseOrderApply','getCurrentUserDept','✅获取当前用户的部门','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"getCurrentUserDept\" }','','','insert',NULL,NULL,NULL),(380,NULL,NULL,'purchaseOrderApply','selectUserList','✅查询用户列表','sql','{}','{ \"table\": \"_view01_user\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(381,NULL,NULL,'purchaseOrderApply','selectPurchaseOrderGoodList','✅查询采购单商品列表','sql','{}','{ \"table\": \"purchase_order_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL),(382,NULL,NULL,'purchaseOrderManagement','selectGoodHistoryPriceList','✅查询商品的历史报价','sql','{}','{ \"table\": \"view01_good_history_price\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '角色表; 软删除未启用;';



INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'appAdmin','系统管理员','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COMMENT '测试用例步骤;',
  `expectedResult` text COMMENT '期望结果',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '测试用例表';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COMMENT 'ui 动作数据',
  `appDataSchema` text COMMENT 'ui 校验数据',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = 'ui 施工方案';






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `groupId` varchar(255) DEFAULT NULL COMMENT '群组Id',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 573 COMMENT = '用户群组角色关联表; 软删除未启用;';



INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (568,'admin','adminGroup','appAdmin','insert',NULL,NULL,NULL),(569,'xiaowang1032','adminGroup','appAdmin','insert',NULL,NULL,NULL),(570,'xiaozhang1032','adminGroup','appAdmin','insert',NULL,NULL,NULL),(571,'zhaojingli1032','adminGroup','appAdmin','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 COMMENT = '用户群组角色 - 页面 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login','allow','登陆页面; 开放所有用户;','insert',NULL,NULL,NULL),(2,'*','login','*','help,manual','allow','工具页; 开放给登陆用户;','insert',NULL,NULL,NULL),(3,'*','login','*','purchaseOrderApply,taskICreateManagement','allow','采购申请&采购审批; 开放给采购部门用户;','insert',NULL,NULL,NULL),(4,'*','adminGroup','appAdmin','*','allow','所有页面; 开放给采购部门用户;','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '用户群组角色 - 请求资源 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login.passwordLogin','allow','登陆resource, 开放给所有用户','insert',NULL,NULL,NULL),(2,'*','login','*','allPage.*','allow','工具类resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL),(3,'*','login','*','*','allow','所有resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text COMMENT '请求的 agent',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_index` (`userId`, `deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: purchase_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(11) DEFAULT NULL COMMENT '顺序id;',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '订单Id',
  `purchaseTitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `purchaseRequirerId` varchar(255) DEFAULT NULL COMMENT '申购人Id;',
  `purchaseRequirerName` varchar(255) DEFAULT NULL COMMENT '申购人名;',
  `purchaseDeptId` varchar(255) DEFAULT NULL COMMENT '申购部门Id',
  `purchaseDeptName` varchar(255) DEFAULT NULL COMMENT '申购部门',
  `purchaseOrderPrice` int(10) DEFAULT '0' COMMENT '采购单的总金额;',
  `workflowId` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `workflowTaskId` varchar(255) DEFAULT NULL COMMENT '流程任务ID',
  `purchasePurchaserId` varchar(255) DEFAULT NULL COMMENT '采购人userId',
  `purchasePurchaserName` varchar(255) DEFAULT NULL COMMENT '采购人',
  `purchaseApprovalrId1` varchar(255) DEFAULT NULL COMMENT '审批人1userId',
  `purchaseApprovalrName1` varchar(255) DEFAULT NULL COMMENT '审批人1',
  `purchaseApprovalrId2` varchar(255) DEFAULT NULL COMMENT '审批人2userId',
  `purchaseApprovalrName2` varchar(255) DEFAULT NULL COMMENT '审批人2',
  `purchaseApprovalrId3` varchar(255) DEFAULT NULL COMMENT '审批人3userId',
  `purchaseApprovalrName3` varchar(255) DEFAULT NULL COMMENT '审批人3',
  `purchaseStatus` varchar(255) DEFAULT 'draft' COMMENT '采购单状态;（draft草稿 【requireApproval申购审批】 requireApply申购 purchaseSearchPrice采购询价 approvaling审核中 purchasing采购中 purchaseFinish采购完成）',
  `isAllStore` varchar(255) DEFAULT '否' COMMENT '是否入库; 所有的商品入库, 这个采购单才为入库',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注; 物流单号、物流链接',
  `applyAt` varchar(255) DEFAULT NULL COMMENT '申请时间; E.g: 2021-05-28T10:24:54+08:00 ',
  `finishAt` varchar(255) DEFAULT NULL COMMENT '完成时间; E.g: 2021-05-28T10:24:54+08:00 ',
  `workflowConfigCustom` text COMMENT '定制的workflow配置;用于修改采购的申批人',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 COMMENT = '采购订单';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: purchase_order_contract
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_contract`;
CREATE TABLE `purchase_order_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractId` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `contractFileType` varchar(255) DEFAULT NULL COMMENT '文件类型; 拓展字段',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '采购单编号',
  `downloadPath` varchar(255) DEFAULT NULL COMMENT '文件下载路径',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `binarySize` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22;




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: purchase_order_good
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_good`;
CREATE TABLE `purchase_order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseOrderGoodId` varchar(255) DEFAULT NULL COMMENT '订单商品Id',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '订单Id',
  `supplierId` varchar(255) DEFAULT NULL COMMENT '供应Id',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品Id',
  `goodName` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goodUnit` varchar(255) DEFAULT '个' COMMENT '单位',
  `goodPrice` double(10, 2) DEFAULT NULL COMMENT '单价',
  `goodCount` int(11) DEFAULT NULL COMMENT '计数',
  `storeCount` int(11) DEFAULT '0' COMMENT '入库数',
  `storeBatchCount` int(11) DEFAULT '0' COMMENT '入库次数;',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注;',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `filledByUserId` varchar(255) DEFAULT NULL COMMENT '报价填写人userId',
  `filledByUser` varchar(255) DEFAULT NULL COMMENT '报价填写人',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 COMMENT = '采购订单-商品';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `taskTitle` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `taskStatus` varchar(255) DEFAULT '0' COMMENT '任务状态：running 执行中；deny 拒绝；end 结束',
  `taskFormInput` text COMMENT '表单',
  `taskConfigId` text COMMENT '当前执行中节点ID',
  `taskLineTypeList` varchar(255) DEFAULT NULL COMMENT '允许的操作（英文逗号分隔）',
  `taskNextConfigList` text COMMENT '执行线路id list: 逗号分隔',
  `taskInitUser` varchar(255) DEFAULT NULL COMMENT '申请人',
  `taskEditUserList` varchar(255) DEFAULT NULL COMMENT '当前执行的处理人员，用逗号分隔',
  `taskEditedUserList` varchar(255) DEFAULT NULL COMMENT '当前已经执行过的处理人员，用逗号分隔',
  `taskViewUserList` varchar(255) DEFAULT NULL COMMENT '所有相关人员，用逗号分隔',
  `workflowConfig` text COMMENT 'work flow流程JSON',
  `createByUser` varchar(255) DEFAULT NULL COMMENT '任务创建人',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 ROW_FORMAT = DYNAMIC COMMENT = '任务表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `taskTitle` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `taskStatus` varchar(255) DEFAULT '0' COMMENT '任务状态：running 执行中；deny 拒绝；end 结束',
  `taskFormInput` text COMMENT '表单',
  `taskConfigId` text COMMENT '当前执行中节点ID',
  `taskNextConfigList` text COMMENT '执行线路id list: 逗号分隔',
  `taskLineTypeList` varchar(255) DEFAULT NULL COMMENT '允许的操作（英文逗号分隔）',
  `taskInitUser` varchar(255) DEFAULT NULL COMMENT '申请人',
  `taskEditUserList` varchar(255) DEFAULT NULL COMMENT '当前执行的处理人员，用逗号分隔',
  `taskViewUserList` varchar(255) DEFAULT NULL COMMENT '所有相关人员，用逗号分隔',
  `taskComment` varchar(255) DEFAULT NULL COMMENT '备注',
  `workflowConfig` text COMMENT 'work flow流程JSON',
  `createByUser` varchar(255) DEFAULT NULL COMMENT '任务创建人',
  `taskExplain` varchar(255) DEFAULT NULL COMMENT '节点说明',
  `taskHandleDesc` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `taskLineFrom` varchar(255) DEFAULT NULL COMMENT '起始节点',
  `taskLineTo` varchar(255) DEFAULT NULL COMMENT '目标节点',
  `taskLineLabel` varchar(255) DEFAULT NULL COMMENT '线路名称描述',
  `taskCostDuration` varchar(255) DEFAULT NULL COMMENT '节点处理时长: 秒单位',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 ROW_FORMAT = DYNAMIC COMMENT = '任务表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflowId` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `workflowName` varchar(255) DEFAULT NULL COMMENT '流程名',
  `workflowForm` text COMMENT 'form表单',
  `workflowConfig` text COMMENT '流程线路节点',
  `workflowCategory` varchar(255) DEFAULT NULL COMMENT '分类ID',
  `workflowRemark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 ROW_FORMAT = DYNAMIC COMMENT = '流程表';







# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_user
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_user` AS
select
  `fs_wms_basic`.`_user`.`id` AS `id`,
  `fs_wms_basic`.`_user`.`idSequence` AS `idSequence`,
  `fs_wms_basic`.`_user`.`userId` AS `userId`,
  `fs_wms_basic`.`_user`.`username` AS `username`,
  `fs_wms_basic`.`_user`.`clearTextPassword` AS `clearTextPassword`,
  `fs_wms_basic`.`_user`.`password` AS `password`,
  `fs_wms_basic`.`_user`.`md5Salt` AS `md5Salt`,
  `fs_wms_basic`.`_user`.`userStatus` AS `userStatus`,
  `fs_wms_basic`.`_user`.`userType` AS `userType`,
  `fs_wms_basic`.`_user`.`userConfig` AS `userConfig`,
  `fs_wms_basic`.`_user`.`operation` AS `operation`,
  `fs_wms_basic`.`_user`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`_user`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`_user`.`operationAt` AS `operationAt`
from
  `fs_wms_basic`.`_user`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dept
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `dept` AS
select
  `fs_wms_basic`.`dept`.`id` AS `id`,
  `fs_wms_basic`.`dept`.`idSequence` AS `idSequence`,
  `fs_wms_basic`.`dept`.`deptId` AS `deptId`,
  `fs_wms_basic`.`dept`.`deptName` AS `deptName`,
  `fs_wms_basic`.`dept`.`deptContact` AS `deptContact`,
  `fs_wms_basic`.`dept`.`deptManagerName` AS `deptManagerName`,
  `fs_wms_basic`.`dept`.`deptManagerContact` AS `deptManagerContact`,
  `fs_wms_basic`.`dept`.`remark` AS `remark`,
  `fs_wms_basic`.`dept`.`rowStatus` AS `rowStatus`,
  `fs_wms_basic`.`dept`.`operation` AS `operation`,
  `fs_wms_basic`.`dept`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`dept`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`dept`.`operationAt` AS `operationAt`
from
  `fs_wms_basic`.`dept`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: supplier
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `supplier` AS
select
  `fs_wms_basic`.`supplier`.`id` AS `id`,
  `fs_wms_basic`.`supplier`.`idSequence` AS `idSequence`,
  `fs_wms_basic`.`supplier`.`supplierId` AS `supplierId`,
  `fs_wms_basic`.`supplier`.`supplierName` AS `supplierName`,
  `fs_wms_basic`.`supplier`.`supplierType` AS `supplierType`,
  `fs_wms_basic`.`supplier`.`supplierAddress` AS `supplierAddress`,
  `fs_wms_basic`.`supplier`.`supplierHome` AS `supplierHome`,
  `fs_wms_basic`.`supplier`.`supplierPerson1` AS `supplierPerson1`,
  `fs_wms_basic`.`supplier`.`supplierContact1` AS `supplierContact1`,
  `fs_wms_basic`.`supplier`.`supplierPerson2` AS `supplierPerson2`,
  `fs_wms_basic`.`supplier`.`supplierContact2` AS `supplierContact2`,
  `fs_wms_basic`.`supplier`.`remark` AS `remark`,
  `fs_wms_basic`.`supplier`.`rowStatus` AS `rowStatus`,
  `fs_wms_basic`.`supplier`.`operation` AS `operation`,
  `fs_wms_basic`.`supplier`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`supplier`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`supplier`.`operationAt` AS `operationAt`
from
  `fs_wms_basic`.`supplier`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_dept
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `user_dept` AS
select
  `fs_wms_basic`.`user_dept`.`id` AS `id`,
  `fs_wms_basic`.`user_dept`.`userId` AS `userId`,
  `fs_wms_basic`.`user_dept`.`deptId` AS `deptId`,
  `fs_wms_basic`.`user_dept`.`roleName` AS `roleName`,
  `fs_wms_basic`.`user_dept`.`operation` AS `operation`,
  `fs_wms_basic`.`user_dept`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`user_dept`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`user_dept`.`operationAt` AS `operationAt`
from
  `fs_wms_basic`.`user_dept`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_history_price
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_history_price` AS
select
  `fs_wms_basic`.`supplier_good_price_history`.`id` AS `id`,
  `fs_wms_basic`.`supplier_good_price_history`.`supplierId` AS `supplierId`,
  `fs_wms_basic`.`supplier_good_price_history`.`goodId` AS `goodId`,
  `fs_wms_basic`.`supplier_good_price_history`.`goodPrice` AS `goodPrice`,
  `fs_wms_basic`.`supplier_good_price_history`.`remark` AS `remark`,
  `fs_wms_basic`.`supplier_good_price_history`.`operation` AS `operation`,
  `fs_wms_basic`.`supplier_good_price_history`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`supplier_good_price_history`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`supplier_good_price_history`.`operationAt` AS `operationAt`
from
  `fs_wms_basic`.`supplier_good_price_history`;





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_price_stock
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_price_stock` AS
select
  `fs_wms_basic`.`good`.`id` AS `id`,
  `fs_wms_basic`.`good`.`goodId` AS `goodId`,
  `fs_wms_basic`.`good`.`goodName` AS `goodName`,
  `fs_wms_basic`.`good`.`goodDesc` AS `goodDesc`,
  `fs_wms_basic`.`good`.`goodType` AS `goodType`,
  `fs_wms_basic`.`good`.`goodUnit` AS `goodUnit`,
  `fs_wms_basic`.`good`.`operation` AS `operation`,
  `fs_wms_basic`.`good`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`good`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`good`.`operationAt` AS `operationAt`,
  ifnull(`fs_wms_warehouse`.`good_store`.`storeCount`, 0) AS `storeCount`,
  `fs_wms_basic`.`good`.`goodCategory` AS `goodCategory`,
  `fs_wms_basic`.`good`.`rowStatus` AS `rowStatus`
from
  (
  `fs_wms_basic`.`good`
  left join `fs_wms_warehouse`.`good_store` on(
    (
    `fs_wms_basic`.`good`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_purchase_order
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_purchase_order` AS
select
  `purchase_order`.`id` AS `id`,
  `purchase_order`.`idSequence` AS `idSequence`,
  `purchase_order`.`purchaseOrderId` AS `purchaseOrderId`,
  `purchase_order`.`purchaseTitle` AS `purchaseTitle`,
  `purchase_order`.`purchaseRequirerId` AS `purchaseRequirerId`,
  `purchase_order`.`purchaseRequirerName` AS `purchaseRequirerName`,
  `purchase_order`.`purchaseDeptId` AS `purchaseDeptId`,
  `purchase_order`.`purchaseDeptName` AS `purchaseDeptName`,
  `purchase_order`.`purchaseOrderPrice` AS `purchaseOrderPrice`,
  `purchase_order`.`workflowId` AS `workflowId`,
  `workflow`.`workflowName` AS `workflowName`,
  `purchase_order`.`workflowTaskId` AS `workflowTaskId`,
  `purchase_order`.`purchasePurchaserId` AS `purchasePurchaserId`,
  `purchase_order`.`purchasePurchaserName` AS `purchasePurchaserName`,
  `purchase_order`.`purchaseApprovalrId1` AS `purchaseApprovalrId1`,
  `purchase_order`.`purchaseApprovalrName1` AS `purchaseApprovalrName1`,
  `purchase_order`.`purchaseApprovalrId2` AS `purchaseApprovalrId2`,
  `purchase_order`.`purchaseApprovalrName2` AS `purchaseApprovalrName2`,
  `purchase_order`.`purchaseApprovalrId3` AS `purchaseApprovalrId3`,
  `purchase_order`.`purchaseApprovalrName3` AS `purchaseApprovalrName3`,
  `purchase_order`.`purchaseStatus` AS `purchaseStatus`,
  `purchase_order`.`isAllStore` AS `isAllStore`,
  `purchase_order`.`remark` AS `remark`,
  `purchase_order`.`finishAt` AS `finishAt`,
  `purchase_order`.`workflowConfigCustom` AS `workflowConfigCustom`,
  `purchase_order`.`operation` AS `operation`,
  `purchase_order`.`operationByUserId` AS `operationByUserId`,
  `purchase_order`.`operationByUser` AS `operationByUser`,
  `purchase_order`.`operationAt` AS `operationAt`,
  `purchase_order`.`applyAt` AS `applyAt`
from
  (
  `purchase_order`
  join `workflow` on(
    (
    `purchase_order`.`workflowId` = `workflow`.`workflowId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_purchase_order_good
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_purchase_order_good` AS
select
  `fs_wms_purchase`.`purchase_order_good`.`id` AS `id`,
  `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_purchase`.`purchase_order`.`purchaseStatus` AS `purchaseStatus`,
  `fs_wms_purchase`.`purchase_order`.`isAllStore` AS `isAllStore`,
  `fs_wms_purchase`.`purchase_order_good`.`supplierId` AS `supplierId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodId` AS `goodId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodName` AS `goodName`,
  `fs_wms_purchase`.`purchase_order_good`.`goodUnit` AS `goodUnit`,
  `fs_wms_purchase`.`purchase_order_good`.`goodPrice` AS `goodPrice`,
  `fs_wms_purchase`.`purchase_order_good`.`goodCount` AS `goodCount`,
  `fs_wms_purchase`.`purchase_order_good`.`storeCount` AS `storeCount`,
  `fs_wms_purchase`.`purchase_order_good`.`storeBatchCount` AS `storeBatchCount`,
  `fs_wms_purchase`.`purchase_order_good`.`remark` AS `remark`,
  `fs_wms_purchase`.`purchase_order_good`.`rowStatus` AS `rowStatus`,
  `fs_wms_purchase`.`purchase_order_good`.`operation` AS `operation`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUser` AS `operationByUser`,
  `fs_wms_purchase`.`purchase_order_good`.`operationAt` AS `operationAt`,
  `fs_wms_purchase`.`purchase_order`.`finishAt` AS `finishAt`,
  `fs_wms_purchase`.`purchase_order`.`purchaseDeptId` AS `purchaseDeptId`,
  `supplier`.`supplierName` AS `supplierName`,
  `fs_wms_purchase`.`purchase_order_good`.`filledByUser` AS `filledByUser`,
  `fs_wms_purchase`.`purchase_order_good`.`filledByUserId` AS `filledByUserId`
from
  (
  (
    `fs_wms_purchase`.`purchase_order_good`
    left join `fs_wms_purchase`.`purchase_order` on(
    (
      `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderId` = `fs_wms_purchase`.`purchase_order`.`purchaseOrderId`
    )
    )
  )
  left join `fs_wms_purchase`.`supplier` on(
    (
    `fs_wms_purchase`.`purchase_order_good`.`supplierId` = `supplier`.`supplierId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_purchase_order_good_store
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_purchase_order_good_store` AS
select
  `fs_wms_warehouse`.`good_store`.`storeCount` AS `storeCount`,
  `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_purchase`.`purchase_order_good`.`id` AS `id`,
  `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_purchase`.`purchase_order_good`.`supplierId` AS `supplierId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodId` AS `goodId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodName` AS `goodName`,
  `fs_wms_purchase`.`purchase_order_good`.`goodPrice` AS `goodPrice`,
  `fs_wms_purchase`.`purchase_order_good`.`goodUnit` AS `goodUnit`,
  `fs_wms_purchase`.`purchase_order_good`.`goodCount` AS `goodCount`,
  `fs_wms_purchase`.`purchase_order_good`.`remark` AS `remark`,
  `fs_wms_purchase`.`purchase_order_good`.`rowStatus` AS `rowStatus`,
  `fs_wms_purchase`.`purchase_order_good`.`operation` AS `operation`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUser` AS `operationByUser`,
  `fs_wms_purchase`.`purchase_order_good`.`operationAt` AS `operationAt`,
  `fs_wms_basic`.`budget_good`.`budgetPrice` AS `budgetPrice`
from
  (
  (
    `fs_wms_purchase`.`purchase_order_good`
    left join `fs_wms_warehouse`.`good_store` on(
    (
      `fs_wms_purchase`.`purchase_order_good`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
    )
    )
  )
  left join `fs_wms_basic`.`budget_good` on(
    (
    `fs_wms_purchase`.`purchase_order_good`.`goodId` = `fs_wms_basic`.`budget_good`.`goodId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_supplier_good
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_supplier_good` AS
select
  `fs_wms_basic`.`supplier_good`.`id` AS `id`,
  `fs_wms_basic`.`supplier_good`.`supplierId` AS `supplierId`,
  `fs_wms_basic`.`supplier`.`supplierName` AS `supplierName`,
  `fs_wms_basic`.`supplier_good`.`goodId` AS `goodId`,
  `fs_wms_basic`.`good`.`goodName` AS `goodName`,
  `fs_wms_basic`.`good`.`goodDesc` AS `goodDesc`,
  `fs_wms_basic`.`supplier_good`.`goodPriceRecent` AS `goodPriceRecent`,
  `fs_wms_basic`.`supplier_good`.`remark` AS `remark`,
  `fs_wms_basic`.`supplier_good`.`operation` AS `operation`,
  `fs_wms_basic`.`supplier_good`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_basic`.`supplier_good`.`operationByUser` AS `operationByUser`,
  `fs_wms_basic`.`supplier_good`.`operationAt` AS `operationAt`
from
  (
  (
    `fs_wms_basic`.`supplier_good`
    left join `fs_wms_basic`.`supplier` on(
    (
      `fs_wms_basic`.`supplier_good`.`supplierId` = `fs_wms_basic`.`supplier`.`supplierId`
    )
    )
  )
  left join `fs_wms_basic`.`good` on(
    (
    `fs_wms_basic`.`supplier_good`.`goodId` = `fs_wms_basic`.`good`.`goodId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_task
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_task` AS
select
  `task`.`id` AS `id`,
  `task`.`taskId` AS `taskId`,
  `task`.`taskTitle` AS `taskTitle`,
  `task`.`taskStatus` AS `taskStatus`,
  `task`.`taskFormInput` AS `taskFormInput`,
  `task`.`taskConfigId` AS `taskConfigId`,
  `task`.`taskLineTypeList` AS `taskLineTypeList`,
  `task`.`taskNextConfigList` AS `taskNextConfigList`,
  `task`.`taskInitUser` AS `taskInitUser`,
  `task`.`taskEditUserList` AS `taskEditUserList`,
  `task`.`taskEditedUserList` AS `taskEditedUserList`,
  `task`.`taskViewUserList` AS `taskViewUserList`,
  `task`.`workflowConfig` AS `workflowConfig`,
  `task`.`createByUser` AS `createByUser`,
  `task`.`operation` AS `operation`,
  `task`.`operationByUserId` AS `operationByUserId`,
  `task`.`operationByUser` AS `operationByUser`,
  `task`.`operationAt` AS `operationAt`,
  `purchase_order`.`purchaseOrderId` AS `purchaseOrderId`,
  `purchase_order`.`purchaseTitle` AS `purchaseTitle`,
  `purchase_order`.`purchaseRequirerId` AS `purchaseRequirerId`,
  `purchase_order`.`purchaseRequirerName` AS `purchaseRequirerName`,
  `purchase_order`.`purchaseDeptId` AS `purchaseDeptId`,
  `purchase_order`.`purchaseDeptName` AS `purchaseDeptName`,
  `purchase_order`.`purchaseOrderPrice` AS `purchaseOrderPrice`,
  `purchase_order`.`purchaseStatus` AS `purchaseStatus`,
  `purchase_order`.`isAllStore` AS `isAllStore`,
  `purchase_order`.`finishAt` AS `finishAt`,
  `purchase_order`.`applyAt` AS `applyAt`,
  `purchase_order`.`purchasePurchaserName` AS `purchasePurchaserName`,
  `purchase_order`.`purchasePurchaserId` AS `purchasePurchaserId`
from
  (
  `task`
  left join `purchase_order` on(
    (
    `task`.`taskId` = `purchase_order`.`workflowTaskId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_user_dept
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_user_dept` AS
select
  `user_dept`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `user_dept`.`deptId` AS `deptId`,
  `user_dept`.`roleName` AS `roleName`,
  `user_dept`.`operation` AS `operation`,
  `user_dept`.`operationByUserId` AS `operationByUserId`,
  `user_dept`.`operationByUser` AS `operationByUser`,
  `user_dept`.`operationAt` AS `operationAt`,
  `user_dept`.`id` AS `id`,
  `dept`.`deptName` AS `deptName`
from
  (
  (
    `fs_wms_purchase`.`user_dept`
    join `fs_wms_purchase`.`_view01_user` `_user` on((`user_dept`.`userId` = `_user`.`userId`))
  )
  join `fs_wms_purchase`.`dept` on((`user_dept`.`deptId` = `dept`.`deptId`))
  );





