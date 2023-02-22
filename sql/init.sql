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
) ENGINE = InnoDB AUTO_INCREMENT = 46 COMMENT = '页面表; 软删除未启用;';



INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','帮助','helpV3','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'login','登陆','loginV3','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,'manual',' 操作手册',NULL,'dynamicInMenu','1','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'workflowManagement','[采购管理]采购流程配置','purchase/workflowManagement','showInMenu','3','update','vscode','vscode','2022-10-08T09:35:35+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'workflowEditor','[采购管理]流程编辑','purchase/workflowEditor','dynamicInMenu','4','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,'purchaseOrderApply','[采购管理]采购申请','purchase/purchaseOrderApply','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,'purchaseOrderManagement','[采购管理]采购单管理','purchase/purchaseOrderManagement','showInMenu','6','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'taskCreateManagement','[采购管理]采购流程申请','purchase/taskCreateManagement','dynamicInMenu','7','update','vscode','vscode','2022-10-08T09:48:22+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'taskICreateManagement','[采购管理]采购审批','purchase/taskICreateManagement','showInMenu','8','update','vscode','vscode','2022-10-08T09:42:17+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (19,'purchaseOrderContract','[采购管理]凭据查看','purchase/purchaseOrderContract','showInMenu','9','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,'purchaseOrderDetail','[采购管理]采购详情','purchase/purchaseOrderDetail','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (30,'userManagement','[基础信息]用户管理','basic/userManagement','showInMenu','2','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (31,'budgetManagement','[基础信息]预算管理','basic/budgetManagement','showInMenu','6','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (32,'supplierManagement','[基础信息]供应商管理','basic/supplierManagement','showInMenu','4','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (33,'goodManagement','[基础信息]商品管理','basic/goodManagement','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (34,'deptManagement','[基础信息]部门管理','basic/deptManagement','showInMenu','3','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (40,'warehouseManagement','[仓库]仓库管理','warehouse/warehouseManagement','showInMenu','3','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (41,'storeWarehouse','[仓库]采购商品入库','warehouse/storeWarehouse','showInMenu','4','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,'consumeOutWarehouse','[仓库]消耗品出库','warehouse/consumeOutWarehouse','showInMenu','6','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,'assetOutWarehouse','[仓库]资产领用/归还','warehouse/assetOutWarehouse','showInMenu','8','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,'consumeManagement','[仓库]消耗品管理','warehouse/consumeManagement','showInMenu','5','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageFile`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,'assetManagement','[仓库]资产管理','warehouse/assetManagement','showInMenu','7','insert',NULL,NULL,NULL);



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
) ENGINE = InnoDB AUTO_INCREMENT = 713 COMMENT = '数据历史表';




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
) ENGINE = InnoDB AUTO_INCREMENT = 542 COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';



INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,NULL,NULL,'login','passwordLogin','✅登陆','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,NULL,NULL,'allPage','logout','✅登出','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"logout\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,NULL,NULL,'allPage','userInfo','✅获取用户信息','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,NULL,NULL,'allPage','getConstantList','✅查询常量','sql','{}','{ \"table\": \"_constant\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (200,NULL,'','deptManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (201,NULL,'{ \"before\": [\n{\"service\": \"common\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','deptManagement','insertItem','✅添加','sql','{}','{ \"table\": \"dept\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (202,NULL,NULL,'deptManagement','updateItem','✅更新','sql','{}','{ \"table\": \"dept\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (203,NULL,NULL,'deptManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"dept\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (204,NULL,'','goodManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (205,NULL,'{ \"before\": [\n{\"service\": \"good\", \"serviceFunction\": \"fillGoodIdBeforeHook\"}\n], \"after\": [\n] }','goodManagement','insertItem','✅添加','sql','{}','{ \"table\": \"good\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (206,NULL,NULL,'goodManagement','updateItem','✅更新','sql','{}','{ \"table\": \"good\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (207,NULL,NULL,'goodManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"good\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (208,NULL,'','supplierManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"supplier\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (209,NULL,'{ \"before\": [\n{\"service\": \"common\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','supplierManagement','insertItem','✅添加','sql','{}','{ \"table\": \"supplier\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (210,NULL,NULL,'supplierManagement','updateItem','✅更新','sql','{}','{ \"table\": \"supplier\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (211,NULL,NULL,'supplierManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"supplier\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (212,NULL,NULL,'supplierManagement','supplierGood-selectItemList','✅supplierGood-查询列表','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (213,NULL,NULL,'supplierManagement','supplierGood-insertItem','✅supplierGood-添加','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (214,NULL,NULL,'supplierManagement','supplierGood-updateItem','✅supplierGood-更新','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (215,NULL,NULL,'supplierManagement','supplierGood-deleteItem','✅supplierGood-删除','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (216,NULL,NULL,'goodManagement','supplierGood-selectItemList','✅supplierGood-查询列表','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (217,NULL,NULL,'goodManagement','supplierGood-insertItem','✅supplierGood-添加','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (218,NULL,NULL,'goodManagement','supplierGood-updateItem','✅supplierGood-更新','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (219,NULL,NULL,'goodManagement','supplierGood-deleteItem','✅supplierGood-删除','sql','{}','{ \"table\": \"supplier_good\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (220,NULL,NULL,'supplierGoodPriceHistoryManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_supplier_good_price_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (221,NULL,NULL,'supplierGoodPriceHistoryManagement','insertItem','✅添加','sql','{}','{ \"table\": \"supplier_good_price_history\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (222,NULL,NULL,'supplierGoodPriceHistoryManagement','updateItem','✅更新','sql','{}','{ \"table\": \"supplier_good_price_history\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (223,NULL,NULL,'supplierGoodPriceHistoryManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"supplier_good_price_history\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (224,NULL,NULL,'budgetManagement','goods-selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_budget_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (225,NULL,'{ \"before\": [\n{\"service\": \"common\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','budgetManagement','good-insertItem','✅添加','sql','{}','{ \"table\": \"budget_good\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (226,NULL,NULL,'budgetManagement','good-updateItem','✅更新','sql','{}','{ \"table\": \"budget_good\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (227,NULL,NULL,'budgetManagement','dept-selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_budget_dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (228,NULL,'{ \"before\": [\n{\"service\": \"common\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','budgetManagement','dept-insertItem','✅添加','sql','{}','{ \"table\": \"budget_dept\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (229,NULL,NULL,'budgetManagement','dept-updateItem','✅更新','sql','{}','{ \"table\": \"budget_dept\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (230,NULL,NULL,'goodManagement','supplierGoodPriceHistory-selectList','✅查询列表','sql','{}','{ \"table\": \"view01_supplier_good_price_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (231,NULL,NULL,'goodManagement','supplierGoodPriceHistory-updateItem','✅更新','sql','{}','{ \"table\": \"supplier_good_price_history\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (232,NULL,NULL,'goodManagement','supplierGoodPriceHistory-insertItem','✅添加','sql','{}','{ \"table\": \"supplier_good_price_history\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (233,NULL,'','budgetManagement','goods-selectGoodList','✅查询列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (234,NULL,'','budgetManagement','dept-selectDeptList','✅查询列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (235,NULL,NULL,'userManagement','selectItemList','‼️仅开发环境---用户管理-查询信息','sql',NULL,'{\"table\": \"_user\", \"operation\": \"select\"}','','','update',NULL,NULL,'2022-04-29T16:33:28+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (236,NULL,NULL,'userManagement','insertItem','‼️仅开发环境---用户管理-查询信息','service',NULL,'{\"service\": \"userManagement\", \"serviceFunction\": \"addUser\"}','','','update',NULL,NULL,'2022-04-28T16:36:00+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (237,NULL,NULL,'userManagement','resetUserPassword','‼️仅开发环境---用户管理-修改密码','service',NULL,'{\"service\": \"userManagement\", \"serviceFunction\": \"resetUserPassword\"}','','','update',NULL,NULL,'2022-04-28T16:37:21+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (238,NULL,NULL,'userManagement','updateItem','‼️仅开发环境---用户管理-更新用户','sql',NULL,'{\"table\": \"_user\", \"operation\": \"jhUpdate\"}','','','update',NULL,NULL,'2022-04-29T16:33:27+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (239,NULL,NULL,'deptManagement','userDept-selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_user_dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (240,NULL,'{ \"before\": [\n{\"service\": \"userDept\", \"serviceFunction\": \"verifyUserDept\"}\n], \"after\": [\n] }','deptManagement','userDept-insertItem','✅添加','sql','{}','{ \"table\": \"user_dept\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (241,NULL,'{ \"before\": [\n{\"service\": \"userDept\", \"serviceFunction\": \"verifyUserDeptForUpdate\"}\n], \"after\": [\n] }','deptManagement','userDept-updateItem','✅更新','sql','{}','{ \"table\": \"user_dept\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (242,NULL,NULL,'deptManagement','userDept-deleteItem','✅删除','sql','{}','{ \"table\": \"user_dept\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (243,NULL,NULL,'deptManagement','user-selectItemList','✅用户管理-查询信息','sql',NULL,'{\"table\": \"_view01_user\", \"operation\": \"select\"}','','','update',NULL,NULL,'2022-04-29T16:33:28+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (244,NULL,NULL,'budgetManagement','dept-recomputeUsedBudgetPriceForDept','✅部门-重新计算已使用预算','service',NULL,'{\"service\": \"budget\", \"serviceFunction\": \"recomputeUsedBudgetPriceForDept\"}','','','update',NULL,NULL,'2022-04-28T16:37:21+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (245,NULL,NULL,'deptManagement','user-selectDrawerItemList','✅部门管理-窗口列表','sql','{}','{\"table\": \"_view01_user\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (246,NULL,NULL,'deptManagement','user-insertItem','✅user-添加','sql','{}','{ \"table\": \"user_dept\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (247,NULL,NULL,'budgetManagement','good-recomputeUsedBudgetPriceForGood','✅商品-重新计算已使用预算','service',NULL,'{\"service\": \"budget\", \"serviceFunction\": \"recomputeUsedBudgetPriceForGood\"}','','','update',NULL,NULL,'2022-04-28T16:37:21+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (248,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (300,NULL,NULL,'workflowManagement','selectItemList','✅workflowManagement查询-查询列表','sql','{}','{\"table\": \"workflow\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (301,NULL,'{\"before\":[{\"service\":\"workflow\",\"serviceFunction\":\"createWorkflowId\"}]}','workflowManagement','insertItem','✅workflowManagement查询-添加成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (302,NULL,NULL,'workflowManagement','updateItem','✅workflowManagement查询-更新成员','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (303,NULL,NULL,'workflowManagement','deleteItem','✅workflowManagement查询-删除信息','sql','{}','{\"table\": \"workflow\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (304,NULL,'','workflowManagement','selectUserList','✅查询-用户列表','sql',NULL,'{\"table\": \"_view01_user\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (305,NULL,'','workflowManagement','selectGroupList','✅查询-组列表','sql',NULL,'{\"table\": \"_group\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-04T22:27:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (306,NULL,NULL,'taskCreateManagement','selectWorkflowList','✅获取流程列表','sql',NULL,'{\"table\": \"workflow\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (307,NULL,'{}','taskCreateManagement','insertItem','✅新增任务','service',NULL,'{\"service\":\"task\",\"serviceFunction\":\"createTask\"}','','','update','vscode','vscode','2022-10-12T23:34:50+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (308,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"whereToViewUserId\"}]}','taskICreateManagement','selectItemList','✅查询-查询列表','sql','{}','{\"table\": \"view01_task\", \"operation\": \"select\"}','','','update','vscode','vscode','2022-07-02T22:48:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (309,NULL,'','taskHistoryManagement','getTaskHistoryInfo','✅获取任务历史详情','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"getTaskHistoryInfo\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (310,NULL,'','taskHistoryManagement','submitNode','✅节点流转','service',NULL,'{\"service\": \"task\", \"serviceFunction\": \"submitNode\"}','','','update','vscode','vscode','2022-07-04T22:22:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (333,NULL,NULL,'purchaseOrderDetail','getPurchaseOrderDetail','✅获取采购订单详情','service','{}','{\"service\":\"purchase\",\"serviceFunction\":\"getPurchaseOrderDetail\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (339,NULL,NULL,'allPage','uploadFileDone','✅ 文件分片上传-所有分片上传完毕','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileDone\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (340,NULL,NULL,'allPage','httpUploadByStream','✅ 文件分片上传-http文件流','service','{}','{\"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\"}','','','update',NULL,NULL,'2022-05-04T16:02:58+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (346,NULL,'{\"before\":[{\"service\":\"task\",\"serviceFunction\":\"historyFilterHook\"}]}','taskICreateManagement','selectTaskHistoryList','✅查询列表','sql','{}','{ \"table\": \"task_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (348,NULL,'','purchaseOrderApply','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (349,NULL,NULL,'purchaseOrderApply','selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view02_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (350,NULL,NULL,'purchaseOrderApply','savePurchaseOrderDraft','✅保存草稿','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"savePurchaseOrderDraft\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (351,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderDraft','✅更新','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderDraft\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (352,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"deletePurchaseOrderGoodList\"}]}','purchaseOrderApply','deleteItem','✅删除','sql','{}','{ \"table\": \"purchase_order\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (353,NULL,NULL,'purchaseOrderApply','goodSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (354,NULL,NULL,'purchaseOrderApply','submitPurchaseOrder','✅提交','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"submitPurchaseOrder\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (355,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderStatus','✅更新采购单状态','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderStatus\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (356,NULL,NULL,'purchaseOrderApply','selectWorkflowList','✅查询审核流程列表','sql','{}','{ \"table\": \"workflow\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (357,NULL,NULL,'purchaseOrderApply','selectDeptList','✅查询部门列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (361,NULL,'','purchaseOrderManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (362,NULL,NULL,'purchaseOrderManagement','goodSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (363,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"appendPurchaseOrderGoodList\"}]}','purchaseOrderManagement','supplierSelect-getSupplierList','✅supplierSelect-查询商品供应商列表','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (364,NULL,'','purchaseOrderManagement','supplierSelect-updateItem','✅supplierSelect-更新成员','service','{}','{\"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderGoodSupplierAndPrice\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (365,NULL,'','purchaseOrderManagement','createWorkflowTask','✅生成工作流任务','service','{}','{\"service\":\"purchase\",\"serviceFunction\":\"createWorkflowTask\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (366,NULL,NULL,'purchaseOrderManagement','supplierSelect-selectGoodPriceStockList','✅查询商品报价库存列表','sql','{}','{ \"table\": \"view01_good_price_stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (367,NULL,NULL,'purchaseOrderManagement','selectSupplierGoodList','✅查询供应商商品','sql','{}','{ \"table\": \"view01_supplier_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (368,NULL,NULL,'purchaseOrderManagement','updatePurchaseOrderStatus','✅更新采购单状态','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderStatus\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (371,NULL,'{\"after\":[{\"service\":\"purchase\",\"serviceFunction\":\"appendPurchaseOrderGoodList\"}]}','purchaseOrderContract','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_purchase_order\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (373,NULL,NULL,'purchaseOrderManagement','contractUpload-selectItemList','✅purchaseOrderContractManagement查询-查询列表','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (374,NULL,'{\"before\":[{\"service\":\"purchaseContract\",\"serviceFunction\":\"fillInsertItemParamsBeforeHook\"}]}','purchaseOrderManagement','contractUpload-insertItem','✅purchaseOrderContractManagement查询-添加成员','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (375,NULL,NULL,'purchaseOrderManagement','contractUpload-updateItem','✅purchaseOrderContractManagement查询-更新成员','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (376,NULL,NULL,'purchaseOrderManagement','contractUpload-deleteItem','✅purchaseOrderContractManagement查询-删除信息','sql','{}','{ \"table\": \"purchase_order_contract\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (377,NULL,NULL,'purchaseOrderApply','updatePurchaseOrderInfo','✅更新采购单信息','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"updatePurchaseOrderInfo\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (378,NULL,NULL,'purchaseOrderManagement','selectPurchaseOrderGoodList','✅查询采购单商品列表','sql','{}','{ \"table\": \"view02_purchase_order_good_store\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (379,NULL,NULL,'purchaseOrderApply','getCurrentUserDept','✅获取当前用户的部门','service','{}','{ \"service\": \"purchase\", \"serviceFunction\": \"getCurrentUserDept\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (380,NULL,NULL,'purchaseOrderApply','selectUserList','✅查询用户列表','sql','{}','{ \"table\": \"_view01_user\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (381,NULL,NULL,'purchaseOrderApply','selectPurchaseOrderGoodList','✅查询采购单商品列表','sql','{}','{ \"table\": \"view01_purchase_order_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (382,NULL,NULL,'purchaseOrderManagement','selectGoodHistoryPriceList','✅查询商品的历史报价','sql','{}','{ \"table\": \"view01_good_history_price\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (500,NULL,NULL,'login','passwordLogin','✅登陆','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (501,NULL,NULL,'allPage','logout','✅登出','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"logout\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (502,NULL,NULL,'allPage','userInfo','✅获取用户信息','service','{}','{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (503,NULL,NULL,'allPage','getConstantList','✅查询常量','sql','{}','{ \"table\": \"_constant\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (504,NULL,'','warehouseManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (505,NULL,'{ \"before\": [\n{\"service\": \"common\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','warehouseManagement','insertItem','✅添加','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (506,NULL,NULL,'warehouseManagement','updateItem','✅更新','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (507,NULL,NULL,'warehouseManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (508,NULL,'','stockManagement','selectItemList','✅stock-查询列表','sql','{}','{ \"table\": \"stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (509,NULL,'{ \"before\": [\n{\"service\": \"stock\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n] }','stockManagement','insertItem','✅stock-添加','sql','{}','{ \"table\": \"stock\", \"operation\": \"insert\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (510,NULL,NULL,'stockManagement','updateItem','✅stock-更新','sql','{}','{ \"table\": \"stock\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (511,NULL,NULL,'stockManagement','deleteItem','✅stock-删除','sql','{}','{ \"table\": \"stock\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (512,NULL,'','storeWarehouse','selectItemList','✅查询列表','sql','{}','{ \"table\": \"view01_purchase_order_good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (513,NULL,'','storeWarehouse','storeGoodByPurchaseOrderGood','✅入库','service','{}','{ \"service\": \"goodStore\", \"serviceFunction\": \"storeGoodByPurchaseOrderGood\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (514,NULL,NULL,'consumeHistory','selectItemList','✅查询消耗品出入库记录','sql','{}','{ \"table\": \"view01_good_consume_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (515,NULL,NULL,'storeWarehouse','computeIsAllStoreForPurchaseOrder','✅入库信息修复','service','{}','{ \"service\": \"goodStore\", \"serviceFunction\": \"computeIsAllStoreForPurchaseOrder\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (516,NULL,NULL,'consumeOutWarehouse','consumeOutWarehouse','✅消耗品出库','service','{}','{ \"service\": \"goodStore\", \"serviceFunction\": \"consumeOutWarehouse\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (517,NULL,NULL,'assetOutWarehouse','assetOperation','✅资产操作','service','{}','{ \"service\": \"goodStore\", \"serviceFunction\": \"assetOperation\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (518,NULL,NULL,'storeWarehouse','selectWarehouseList','✅查询仓库列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (519,NULL,NULL,'consumeManagement','selectItemList','✅查询消耗品列表','sql','{}','{ \"table\": \"view01_good_consume\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (520,NULL,NULL,'consumeManagement','selectGoodList','✅查询商品列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (521,NULL,NULL,'consumeManagement','selectWarehouseList','✅查询仓库列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (523,NULL,NULL,'consumeOutWarehouse','selectItemList','✅查询消耗品列表','sql','{}','{ \"table\": \"view01_good_consume\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (524,NULL,NULL,'consumeOutWarehouse','selectGoodList','✅查询商品列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (525,NULL,NULL,'consumeOutWarehouse','selectWarehouseList','✅查询仓库列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (526,NULL,NULL,'assetHistory','selectItemList','✅查询资产状态记录','sql','{}','{ \"table\": \"view01_good_asset_history\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (527,NULL,NULL,'assetManagement','selectItemList','✅查询资产列表','sql','{}','{ \"table\": \"view01_good_asset\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (528,NULL,NULL,'assetManagement','selectGoodList','✅查询商品列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (529,NULL,NULL,'assetManagement','selectWarehouseList','✅查询仓库列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (531,NULL,NULL,'assetOutWarehouse','selectItemList','✅查询资产列表','sql','{}','{ \"table\": \"view01_good_asset\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (532,NULL,NULL,'assetOutWarehouse','selectGoodList','✅查询商品列表','sql','{}','{ \"table\": \"good\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (533,NULL,NULL,'assetOutWarehouse','selectWarehouseList','✅查询仓库列表','sql','{}','{ \"table\": \"warehouse\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (534,NULL,NULL,'storeWarehouse','selectStockList','✅查询货架列表','sql','{}','{ \"table\": \"stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (535,NULL,NULL,'assetOutWarehouse','selectStockList','✅查询货架列表','sql','{}','{ \"table\": \"stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (536,NULL,NULL,'consumeOutWarehouse','selectDeptList','✅查询部门列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (537,NULL,NULL,'assetOutWarehouse','selectDeptList','✅查询部门列表','sql','{}','{ \"table\": \"dept\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (538,NULL,NULL,'consumeManagement','selectStockList','✅查询货架列表','sql','{}','{ \"table\": \"stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (539,NULL,NULL,'assetManagement','selectStockList','✅查询货架列表','sql','{}','{ \"table\": \"stock\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (540,NULL,NULL,'consumeManagement','updateItem','✅消耗品更新','sql','{}','{ \"table\": \"good_consume\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (541,NULL,NULL,'assetManagement','updateItem','资产更新','sql','{}','{ \"table\": \"good_asset\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);



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
# SCHEMA DUMP FOR TABLE: _user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) DEFAULT NULL COMMENT '自增id; 用于生成userId',
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `clearTextPassword` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `md5Salt` varchar(255) DEFAULT NULL COMMENT 'md5Salt',
  `userStatus` varchar(255) DEFAULT 'active' COMMENT '用户账号状态：活跃或关闭',
  `userType` varchar(255) DEFAULT NULL COMMENT '用户类型; staff, student.',
  `userConfig` text COMMENT '配置信息',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440 COMMENT = '用户表';

INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `clearTextPassword`, `password`, `md5Salt`, `userStatus`, `userType`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (42, NULL, 'admin', '系统管理员', '123456', '38d61d315e62546fe7f1013e31d42f57', 'Xs4JSZnhiwsR', 'active', NULL, NULL, 'insert', NULL, NULL, NULL);


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
) ENGINE = InnoDB AUTO_INCREMENT = 569 COMMENT = '用户群组角色关联表; 软删除未启用;';



INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (568,'admin','adminGroup','appAdmin','insert',NULL,NULL,NULL);



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
) ENGINE = InnoDB AUTO_INCREMENT = 4 COMMENT = '用户群组角色 - 页面 映射表; 软删除未启用;';



INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login','allow','登陆页面; 开放所有用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','help,manual','allow','工具页; 开放给登陆用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有页面; 开放所有用户;','insert',NULL,NULL,NULL);



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



INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login.passwordLogin','allow','登陆resource, 开放给所有用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','allPage.*','allow','工具类resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);



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
) ENGINE = InnoDB AUTO_INCREMENT = 110 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: budget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `budget`;
CREATE TABLE `budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budgetId` varchar(255) DEFAULT NULL COMMENT '预算Id; 30000++',
  `budgetBizId` varchar(255) DEFAULT NULL COMMENT '预算业务Id; 商品Id、部门Id',
  `budgetType` varchar(255) DEFAULT NULL COMMENT '预算类型; 指定商品预算, 指定商品类目预算, 部门预算-月度, 部门预算-年度',
  `budgetStartDate` varchar(255) DEFAULT NULL COMMENT '预算开始时间; 2022-10-01',
  `budgetEndDate` varchar(255) DEFAULT NULL COMMENT '预算开始时间; 2022-10-01',
  `budgetPrice` double DEFAULT NULL COMMENT '预算价格',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '预算配置表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: budget_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `budget_dept`;
CREATE TABLE `budget_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `budgetId` varchar(255) DEFAULT NULL COMMENT '预算Id; 40000++',
  `deptId` varchar(255) DEFAULT NULL COMMENT '部门Id',
  `budgetStartDate` varchar(255) DEFAULT NULL COMMENT '预算开始时间; 2022-10-01',
  `budgetEndDate` varchar(255) DEFAULT NULL COMMENT '预算结束时间; 2022-11-01',
  `budgetPrice` double DEFAULT NULL COMMENT '预算价格',
  `usedBudgetPrice` double DEFAULT '0' COMMENT '已使用的预算',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) NOT NULL DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '部门预算-配置表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: budget_good
# ------------------------------------------------------------

DROP TABLE IF EXISTS `budget_good`;
CREATE TABLE `budget_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `budgetId` varchar(255) DEFAULT NULL COMMENT '预算Id; 30000++',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品Id',
  `budgetStartDate` varchar(255) DEFAULT NULL COMMENT '预算开始时间; 2022-10-01',
  `budgetEndDate` varchar(255) DEFAULT NULL COMMENT '预算结束时间; 2022-11-01',
  `budgetPrice` decimal(10, 2) DEFAULT '0.00' COMMENT '总预算',
  `usedBudgetPrice` decimal(10, 2) DEFAULT NULL COMMENT '已使用预算',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 COMMENT = '商品预算-配置表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `deptId` varchar(255) DEFAULT NULL COMMENT '部门编号',
  `deptName` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `deptContact` varchar(255) DEFAULT NULL COMMENT '部门办公电话',
  `deptManagerName` varchar(255) DEFAULT NULL COMMENT '部门经理;',
  `deptManagerContact` varchar(255) DEFAULT NULL COMMENT '部门经理联系方式;',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) NOT NULL DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `deptId_unique` (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 COMMENT = '部门信息表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号; XH+idSequence, XH+idSequence',
  `goodName` varchar(255) DEFAULT NULL COMMENT '商品名称; 名称包含规格',
  `goodDesc` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `goodType` varchar(255) DEFAULT NULL COMMENT '商品类型',
  `goodUnit` varchar(255) DEFAULT '个' COMMENT '单位',
  `goodCategory` varchar(255) DEFAULT NULL COMMENT '商品分类; 消耗品、资产',
  `goodSuggestPrice` decimal(10, 2) DEFAULT NULL COMMENT '商品建议价格',
  `assetExtend` varchar(255) DEFAULT NULL COMMENT '资产拓展字段; 预留',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `goodId_unique` (`goodId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7962 COMMENT = '商品信息表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good_asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_asset`;
CREATE TABLE `good_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `assetId` varchar(255) DEFAULT NULL COMMENT '资产编号; goodId+00001;',
  `financeAssetId` varchar(255) DEFAULT NULL COMMENT '财务资产Id',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架编号;',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号;',
  `assetOperation` varchar(255) DEFAULT NULL COMMENT '资产操作; 可以当作状态来用 入库、领取、维修',
  `assetOperationUser` varchar(255) DEFAULT NULL COMMENT '资产操作人;',
  `assetOperationDeptId` varchar(255) DEFAULT NULL COMMENT '资产操作部门;',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '采购单Id',
  `purchaseOrderGoodId` varchar(255) DEFAULT NULL COMMENT '采购单商品Id',
  `storeAt` varchar(255) DEFAULT NULL COMMENT '入库时间; E.g: 2021-05-28T10:24:54+08:00',
  `expirationAt` varchar(255) DEFAULT NULL COMMENT '保质期; E.g: 2021-05-28T10:24:54+08:00',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `assetId_unique` (`assetId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6174 COMMENT = '资产表(单个资产)';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good_asset_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_asset_history`;
CREATE TABLE `good_asset_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` varchar(255) DEFAULT NULL COMMENT '资产编号;',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架编号;',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号;',
  `assetOperation` varchar(255) DEFAULT NULL COMMENT '资产操作类型; 入库、领取、维修',
  `assetOperationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00',
  `assetOperationUser` varchar(255) DEFAULT NULL COMMENT '操作人',
  `assetOperationDeptId` varchar(255) DEFAULT NULL COMMENT '资产操作部门',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '采购单Id',
  `purchaseOrderGoodId` varchar(255) DEFAULT NULL COMMENT '采购单商品Id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 518 COMMENT = '资产-操作历史';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good_consume
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_consume`;
CREATE TABLE `good_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumeId` varchar(255) DEFAULT NULL COMMENT '消耗品编号; 使用storeBatchId即可',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架编号;',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号;',
  `storeCountOfConsume` int(11) DEFAULT NULL COMMENT '库存数量;',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '采购单Id',
  `purchaseOrderGoodId` varchar(255) DEFAULT NULL COMMENT '采购单商品Id',
  `storeAt` varchar(255) DEFAULT NULL COMMENT '入库时间; E.g: 2021-05-28T10:24:54+08:00',
  `expirationAt` varchar(255) DEFAULT NULL COMMENT '保质期; E.g: 2021-05-28T10:24:54+08:00',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 456 COMMENT = '消耗品表(入库批次维度)';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good_consume_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_consume_history`;
CREATE TABLE `good_consume_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumeId` varchar(255) DEFAULT NULL COMMENT '消耗品编号;',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架编号;',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号;',
  `consumeOperation` varchar(255) DEFAULT NULL COMMENT '消耗品操作类型; 入库、出库',
  `consumeOperationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00',
  `consumeOperationUser` varchar(255) DEFAULT NULL COMMENT '操作人',
  `consumeOperationDeptId` varchar(255) DEFAULT NULL COMMENT '操作人部门',
  `consumeOperationCount` int(11) DEFAULT '0' COMMENT '操作数量;',
  `purchaseOrderId` varchar(255) DEFAULT NULL COMMENT '采购单Id',
  `purchaseOrderGoodId` varchar(255) DEFAULT NULL COMMENT '采购单商品Id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 462 COMMENT = '消耗品-操作历史';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: good_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_store`;
CREATE TABLE `good_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品编号;',
  `storeCount` int(11) DEFAULT NULL COMMENT '库存;',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `warehouseId_goodId_unique` (`goodId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1435 COMMENT = '库存表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: payment_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_record`;
CREATE TABLE `payment_record` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `recordId` int(11) DEFAULT NULL COMMENT '编号',
  `recordType` varchar(255) DEFAULT NULL COMMENT '单据类型：付款-payment | 回款-repayment',
  `paymentType` varchar(255) DEFAULT NULL COMMENT '货款类型：采购-purchase | 销售退货-salesReturn | 销售-sales | 采购退货-purchaseReturn',
  `paymentTypeCode` varchar(255) DEFAULT NULL COMMENT '货款类型单号',
  `paymentMethod` varchar(255) DEFAULT NULL COMMENT '回款/付款方式：支票、现金、微信等',
  `amount` decimal(10, 2) DEFAULT NULL COMMENT '金额',
  `recordDate` varchar(255) DEFAULT NULL COMMENT '日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `workflowId` varchar(255) DEFAULT NULL COMMENT '流程ID',
  `workflowTaskId` varchar(255) DEFAULT NULL COMMENT '流程任务ID',
  `workflowConfigCustom` text COMMENT '流程config',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB;




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
) ENGINE = InnoDB AUTO_INCREMENT = 90 COMMENT = '采购订单';




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
) ENGINE = InnoDB AUTO_INCREMENT = 27;




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
) ENGINE = InnoDB AUTO_INCREMENT = 137 COMMENT = '采购订单-商品';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架Id',
  `stockName` varchar(255) DEFAULT NULL COMMENT '货架名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `stockId_unique` (`stockId`) USING BTREE,
  UNIQUE KEY `stockName_unique` (`warehouseId`, `stockName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 COMMENT = '仓库-货架表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `supplierId` varchar(255) DEFAULT NULL COMMENT '供应编号',
  `supplierName` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `supplierType` varchar(255) DEFAULT NULL COMMENT '供应商类型;  公司/个人',
  `supplierAddress` varchar(255) DEFAULT NULL COMMENT '供应商地址',
  `supplierHome` varchar(255) DEFAULT NULL COMMENT '供应商门户网站; 官网、公众号地址',
  `supplierPerson1` varchar(255) DEFAULT NULL COMMENT '供应商联系人1; xxx-经理',
  `supplierContact1` varchar(255) DEFAULT NULL COMMENT '供应商联系人1-电话',
  `supplierPerson2` varchar(255) DEFAULT NULL COMMENT '供应商联系人2; xxx-经理',
  `supplierContact2` varchar(255) DEFAULT NULL COMMENT '供应商联系人2-电话',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) NOT NULL DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1719 COMMENT = '供应商信息表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: supplier_good
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_good`;
CREATE TABLE `supplier_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `supplierId` varchar(255) DEFAULT NULL COMMENT '供应商Id',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品Id',
  `goodPriceRecent` double DEFAULT NULL COMMENT '商品最近价格',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) NOT NULL DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `supplierId_goodId_unique` (`supplierId`, `goodId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10764 COMMENT = '供应商商品';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: supplier_good_price_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_good_price_history`;
CREATE TABLE `supplier_good_price_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` varchar(255) DEFAULT NULL COMMENT '供应商Id',
  `goodId` varchar(255) DEFAULT NULL COMMENT '商品Id',
  `goodPrice` double DEFAULT NULL COMMENT '商品报价',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 COMMENT = '供应商商品-报价历史';




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
) ENGINE = InnoDB AUTO_INCREMENT = 497 COMMENT = '任务表';




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
) ENGINE = InnoDB AUTO_INCREMENT = 462 COMMENT = '任务表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id;',
  `deptId` varchar(255) DEFAULT NULL COMMENT '部门id;',
  `roleName` varchar(255) DEFAULT NULL COMMENT '角色名称;',
  `operation` varchar(255) DEFAULT NULL,
  `operationByUserId` varchar(255) DEFAULT NULL,
  `operationByUser` varchar(255) DEFAULT NULL,
  `operationAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `deptId_userId_uniq` (`deptId`, `userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 368;




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: warehourse_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `warehourse_stock`;
CREATE TABLE `warehourse_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `stockId` varchar(255) DEFAULT NULL COMMENT '货架Id',
  `stockName` varchar(255) DEFAULT NULL COMMENT '货架名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `stockId_unique` (`stockId`) USING BTREE,
  UNIQUE KEY `stockName_unique` (`warehouseId`, `stockName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 COMMENT = '仓库-货架表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(255) DEFAULT NULL COMMENT '顺序id;',
  `warehouseId` varchar(255) DEFAULT NULL COMMENT '仓库编号;',
  `warehouseName` varchar(255) DEFAULT NULL COMMENT '仓库名;',
  `warehouseType` varchar(255) DEFAULT NULL COMMENT '仓库类型; 停车位, 房间, 库房, 其它',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注;',
  `rowStatus` varchar(255) DEFAULT '正常' COMMENT '数据状态;草稿,回收站,正常',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `warehouseName_unique` (`warehouseName`) USING BTREE,
  KEY `warehouseId_unique` (`warehouseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 382 COMMENT = '仓库表';




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
) ENGINE = InnoDB AUTO_INCREMENT = 56 COMMENT = '流程表';




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
# SCHEMA DUMP FOR TABLE: view01_budget_dept
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_budget_dept` AS
select
  `budget_dept`.`id` AS `id`,
  `budget_dept`.`budgetId` AS `budgetId`,
  `budget_dept`.`deptId` AS `deptId`,
  `budget_dept`.`budgetStartDate` AS `budgetStartDate`,
  `budget_dept`.`budgetEndDate` AS `budgetEndDate`,
  `budget_dept`.`budgetPrice` AS `budgetPrice`,
  `budget_dept`.`remark` AS `remark`,
  `budget_dept`.`operation` AS `operation`,
  `budget_dept`.`operationByUserId` AS `operationByUserId`,
  `budget_dept`.`operationByUser` AS `operationByUser`,
  `budget_dept`.`operationAt` AS `operationAt`,
  `dept`.`deptName` AS `deptName`,
  `budget_dept`.`idSequence` AS `idSequence`,
  `budget_dept`.`rowStatus` AS `rowStatus`,
  `budget_dept`.`usedBudgetPrice` AS `usedBudgetPrice`
from
  (
  `budget_dept`
  join `dept` on((`budget_dept`.`deptId` = `dept`.`deptId`))
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_budget_good
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_budget_good` AS
select
  `budget_good`.`id` AS `id`,
  `budget_good`.`budgetId` AS `budgetId`,
  `budget_good`.`goodId` AS `goodId`,
  `budget_good`.`budgetStartDate` AS `budgetStartDate`,
  `budget_good`.`budgetEndDate` AS `budgetEndDate`,
  `budget_good`.`budgetPrice` AS `budgetPrice`,
  `budget_good`.`remark` AS `remark`,
  `budget_good`.`operation` AS `operation`,
  `budget_good`.`operationByUserId` AS `operationByUserId`,
  `budget_good`.`operationByUser` AS `operationByUser`,
  `budget_good`.`operationAt` AS `operationAt`,
  `good`.`goodName` AS `goodName`,
  `budget_good`.`rowStatus` AS `rowStatus`,
  `budget_good`.`usedBudgetPrice` AS `usedBudgetPrice`
from
  (
  `budget_good`
  join `good` on((`budget_good`.`goodId` = `good`.`goodId`))
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_asset
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_asset` AS
select
  `fs_wms_warehouse`.`good_asset`.`id` AS `id`,
  `fs_wms_warehouse`.`good_asset`.`idSequence` AS `idSequence`,
  `fs_wms_warehouse`.`good_asset`.`assetId` AS `assetId`,
  `fs_wms_warehouse`.`good_asset`.`warehouseId` AS `warehouseId`,
  `fs_wms_warehouse`.`warehouse`.`warehouseName` AS `warehouseName`,
  `fs_wms_warehouse`.`good_asset`.`stockId` AS `stockId`,
  `fs_wms_warehouse`.`stock`.`stockName` AS `stockName`,
  `fs_wms_warehouse`.`good_asset`.`goodId` AS `goodId`,
  `good`.`goodName` AS `goodName`,
  `good`.`goodDesc` AS `goodDesc`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodUnit` AS `goodUnit`,
  `good`.`goodCategory` AS `goodCategory`,
  `fs_wms_warehouse`.`good_asset`.`assetOperation` AS `assetOperation`,
  `fs_wms_warehouse`.`good_asset`.`assetOperationUser` AS `assetOperationUser`,
  `fs_wms_warehouse`.`good_asset`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_warehouse`.`good_asset`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_warehouse`.`good_asset`.`storeAt` AS `storeAt`,
  `fs_wms_warehouse`.`good_asset`.`expirationAt` AS `expirationAt`,
  `fs_wms_warehouse`.`good_asset`.`remark` AS `remark`,
  `fs_wms_warehouse`.`good_asset`.`operation` AS `operation`,
  `fs_wms_warehouse`.`good_asset`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_warehouse`.`good_asset`.`operationByUser` AS `operationByUser`,
  `fs_wms_warehouse`.`good_asset`.`operationAt` AS `operationAt`,
  `fs_wms_warehouse`.`good_asset`.`assetOperationDeptId` AS `assetOperationDeptId`,
  `dept`.`deptName` AS `deptName`
from
  (
  (
    (
    (
      `fs_wms_warehouse`.`good_asset`
      left join `fs_wms_warehouse`.`good` on(
      (
        `fs_wms_warehouse`.`good_asset`.`goodId` = `good`.`goodId`
      )
      )
    )
    left join `fs_wms_warehouse`.`warehouse` on(
      (
      `fs_wms_warehouse`.`good_asset`.`warehouseId` = `fs_wms_warehouse`.`warehouse`.`warehouseId`
      )
    )
    )
    left join `fs_wms_warehouse`.`stock` on(
    (
      `fs_wms_warehouse`.`good_asset`.`stockId` = `fs_wms_warehouse`.`stock`.`stockId`
    )
    )
  )
  left join `fs_wms_warehouse`.`dept` on(
    (
    `fs_wms_warehouse`.`good_asset`.`purchaseOrderId` = `dept`.`deptId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_asset_history
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_asset_history` AS
select
  `fs_wms_warehouse`.`good_asset_history`.`id` AS `id`,
  `fs_wms_warehouse`.`good_asset_history`.`assetId` AS `assetId`,
  `fs_wms_warehouse`.`good_asset_history`.`warehouseId` AS `warehouseId`,
  `fs_wms_warehouse`.`warehouse`.`warehouseName` AS `warehouseName`,
  `fs_wms_warehouse`.`good_asset_history`.`stockId` AS `stockId`,
  `fs_wms_warehouse`.`stock`.`stockName` AS `stockName`,
  `fs_wms_warehouse`.`good_asset_history`.`goodId` AS `goodId`,
  `fs_wms_warehouse`.`good_asset_history`.`assetOperation` AS `assetOperation`,
  `fs_wms_warehouse`.`good_asset_history`.`assetOperationAt` AS `assetOperationAt`,
  `fs_wms_warehouse`.`good_asset_history`.`assetOperationUser` AS `assetOperationUser`,
  `fs_wms_warehouse`.`good_asset_history`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_warehouse`.`good_asset_history`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_warehouse`.`good_asset_history`.`remark` AS `remark`,
  `fs_wms_warehouse`.`good_asset_history`.`operation` AS `operation`,
  `fs_wms_warehouse`.`good_asset_history`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_warehouse`.`good_asset_history`.`operationByUser` AS `operationByUser`,
  `fs_wms_warehouse`.`good_asset_history`.`operationAt` AS `operationAt`,
  `purchase_order`.`purchaseTitle` AS `purchaseTitle`,
  `good`.`goodName` AS `goodName`,
  `good`.`goodDesc` AS `goodDesc`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodUnit` AS `goodUnit`,
  `good`.`goodCategory` AS `goodCategory`,
  `fs_wms_warehouse`.`good_asset_history`.`assetOperationDeptId` AS `assetOperationDeptId`,
  `dept`.`deptName` AS `deptName`
from
  (
  (
    (
    (
      (
      `fs_wms_warehouse`.`good_asset_history`
      left join `fs_wms_warehouse`.`purchase_order` on(
        (
        `fs_wms_warehouse`.`good_asset_history`.`purchaseOrderId` = `purchase_order`.`purchaseOrderId`
        )
      )
      )
      left join `fs_wms_warehouse`.`warehouse` on(
      (
        `fs_wms_warehouse`.`good_asset_history`.`warehouseId` = `fs_wms_warehouse`.`warehouse`.`warehouseId`
      )
      )
    )
    left join `fs_wms_warehouse`.`good` on(
      (
      `fs_wms_warehouse`.`good_asset_history`.`goodId` = `good`.`goodId`
      )
    )
    )
    left join `fs_wms_warehouse`.`stock` on(
    (
      `fs_wms_warehouse`.`good_asset_history`.`stockId` = `fs_wms_warehouse`.`stock`.`stockId`
    )
    )
  )
  left join `fs_wms_warehouse`.`dept` on(
    (
    `fs_wms_warehouse`.`good_asset_history`.`assetOperationDeptId` = `dept`.`deptId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_consume
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_consume` AS
select
  `fs_wms_warehouse`.`good_consume`.`id` AS `id`,
  `fs_wms_warehouse`.`good_consume`.`consumeId` AS `consumeId`,
  `fs_wms_warehouse`.`good_consume`.`warehouseId` AS `warehouseId`,
  `fs_wms_warehouse`.`warehouse`.`warehouseName` AS `warehouseName`,
  `fs_wms_warehouse`.`warehouse`.`warehouseType` AS `warehouseType`,
  `fs_wms_warehouse`.`good_consume`.`stockId` AS `stockId`,
  `fs_wms_warehouse`.`stock`.`stockName` AS `stockName`,
  `fs_wms_warehouse`.`good_consume`.`goodId` AS `goodId`,
  `good`.`goodName` AS `goodName`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodUnit` AS `goodUnit`,
  `good`.`goodCategory` AS `goodCategory`,
  `fs_wms_warehouse`.`good_store`.`storeCount` AS `storeCount`,
  `fs_wms_warehouse`.`good_consume`.`storeCountOfConsume` AS `storeCountOfConsume`,
  `fs_wms_warehouse`.`good_consume`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_warehouse`.`good_consume`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_warehouse`.`good_consume`.`storeAt` AS `storeAt`,
  `fs_wms_warehouse`.`good_consume`.`expirationAt` AS `expirationAt`,
  `fs_wms_warehouse`.`good_consume`.`remark` AS `remark`,
  `fs_wms_warehouse`.`good_consume`.`operation` AS `operation`,
  `fs_wms_warehouse`.`good_consume`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_warehouse`.`good_consume`.`operationByUser` AS `operationByUser`,
  `fs_wms_warehouse`.`good_consume`.`operationAt` AS `operationAt`
from
  (
  (
    (
    (
      `fs_wms_warehouse`.`good_consume`
      left join `fs_wms_warehouse`.`good_store` on(
      (
        `fs_wms_warehouse`.`good_consume`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
      )
      )
    )
    left join `fs_wms_warehouse`.`good` on(
      (
      `fs_wms_warehouse`.`good_consume`.`goodId` = `good`.`goodId`
      )
    )
    )
    left join `fs_wms_warehouse`.`warehouse` on(
    (
      `fs_wms_warehouse`.`good_consume`.`warehouseId` = `fs_wms_warehouse`.`warehouse`.`warehouseId`
    )
    )
  )
  left join `fs_wms_warehouse`.`stock` on(
    (
    `fs_wms_warehouse`.`good_consume`.`stockId` = `fs_wms_warehouse`.`stock`.`stockId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_good_consume_history
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_consume_history` AS
select
  `good`.`goodName` AS `goodName`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodUnit` AS `goodUnit`,
  `good`.`goodCategory` AS `goodCategory`,
  `purchase_order`.`purchaseTitle` AS `purchaseTitle`,
  `fs_wms_warehouse`.`good_consume_history`.`id` AS `id`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeId` AS `consumeId`,
  `fs_wms_warehouse`.`good_consume_history`.`warehouseId` AS `warehouseId`,
  `fs_wms_warehouse`.`warehouse`.`warehouseName` AS `warehouseName`,
  `fs_wms_warehouse`.`good_consume_history`.`stockId` AS `stockId`,
  `fs_wms_warehouse`.`stock`.`stockName` AS `stockName`,
  `fs_wms_warehouse`.`good_consume_history`.`goodId` AS `goodId`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeOperation` AS `consumeOperation`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeOperationAt` AS `consumeOperationAt`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeOperationUser` AS `consumeOperationUser`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeOperationCount` AS `consumeOperationCount`,
  `fs_wms_warehouse`.`good_consume_history`.`purchaseOrderId` AS `purchaseOrderId`,
  `fs_wms_warehouse`.`good_consume_history`.`purchaseOrderGoodId` AS `purchaseOrderGoodId`,
  `fs_wms_warehouse`.`good_consume_history`.`remark` AS `remark`,
  `fs_wms_warehouse`.`good_consume_history`.`operation` AS `operation`,
  `fs_wms_warehouse`.`good_consume_history`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_warehouse`.`good_consume_history`.`operationByUser` AS `operationByUser`,
  `fs_wms_warehouse`.`good_consume_history`.`operationAt` AS `operationAt`,
  `fs_wms_warehouse`.`good_consume_history`.`consumeOperationDeptId` AS `consumeOperationDeptId`,
  `dept`.`deptName` AS `deptName`
from
  (
  (
    (
    (
      (
      `fs_wms_warehouse`.`good_consume_history`
      left join `fs_wms_warehouse`.`purchase_order` on(
        (
        `fs_wms_warehouse`.`good_consume_history`.`purchaseOrderId` = `purchase_order`.`purchaseOrderId`
        )
      )
      )
      left join `fs_wms_warehouse`.`warehouse` on(
      (
        `fs_wms_warehouse`.`good_consume_history`.`warehouseId` = `fs_wms_warehouse`.`warehouse`.`warehouseId`
      )
      )
    )
    left join `fs_wms_warehouse`.`good` on(
      (
      `fs_wms_warehouse`.`good_consume_history`.`goodId` = `good`.`goodId`
      )
    )
    )
    left join `fs_wms_warehouse`.`stock` on(
    (
      `fs_wms_warehouse`.`good_consume_history`.`stockId` = `fs_wms_warehouse`.`stock`.`stockId`
    )
    )
  )
  left join `fs_wms_warehouse`.`dept` on(
    (
    `fs_wms_warehouse`.`good_consume_history`.`consumeOperationDeptId` = `dept`.`deptId`
    )
  )
  );





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
# SCHEMA DUMP FOR TABLE: view01_good_of_supplier_count
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_good_of_supplier_count` AS
select
  `fs_wms_basic`.`good`.`goodId` AS `goodId`,
  count(`fs_wms_basic`.`supplier_good`.`supplierId`) AS `supplierCount`
from
  (
  `fs_wms_basic`.`good`
  left join `fs_wms_basic`.`supplier_good` on(
    (
    `fs_wms_basic`.`good`.`goodId` = `fs_wms_basic`.`supplier_good`.`goodId`
    )
  )
  )
group by
  `fs_wms_basic`.`good`.`goodId`;





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
  `fs_wms_basic`.`good`.`rowStatus` AS `rowStatus`,
  `fs_wms_basic`.`good`.`goodSuggestPrice` AS `goodSuggestPrice`
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
  `fs_wms_purchase`.`purchase_order`.`purchaseTitle` AS `purchaseTitle`,
  `fs_wms_purchase`.`purchase_order`.`purchaseStatus` AS `purchaseStatus`,
  `fs_wms_purchase`.`purchase_order`.`finishAt` AS `finishAt`,
  `fs_wms_purchase`.`purchase_order`.`isAllStore` AS `isAllStore`,
  `fs_wms_purchase`.`purchase_order_good`.`supplierId` AS `supplierId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodId` AS `goodId`,
  `fs_wms_purchase`.`purchase_order_good`.`goodCount` AS `goodCount`,
  `fs_wms_purchase`.`purchase_order_good`.`remark` AS `remark`,
  `fs_wms_purchase`.`purchase_order_good`.`rowStatus` AS `rowStatus`,
  `fs_wms_purchase`.`purchase_order_good`.`operation` AS `operation`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUserId` AS `operationByUserId`,
  `fs_wms_purchase`.`purchase_order_good`.`operationByUser` AS `operationByUser`,
  `fs_wms_purchase`.`purchase_order_good`.`operationAt` AS `operationAt`,
  `fs_wms_purchase`.`purchase_order`.`purchaseDeptId` AS `purchaseDeptId`,
  `fs_wms_purchase`.`purchase_order`.`purchaseDeptName` AS `purchaseDeptName`,
  `fs_wms_purchase`.`purchase_order_good`.`storeCount` AS `storeCount`,
  `fs_wms_purchase`.`purchase_order_good`.`storeBatchCount` AS `storeBatchCount`,
  `fs_wms_purchase`.`purchase_order_good`.`goodPrice` AS `goodPrice`
from
  (
  `fs_wms_purchase`.`purchase_order_good`
  left join `fs_wms_purchase`.`purchase_order` on(
    (
    `fs_wms_purchase`.`purchase_order_good`.`purchaseOrderId` = `fs_wms_purchase`.`purchase_order`.`purchaseOrderId`
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
  `supplier`.`supplierName` AS `supplierName`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodCategory` AS `goodCategory`,
  `good`.`goodSuggestPrice` AS `goodSuggestPrice`
from
  (
  (
    (
    `fs_wms_purchase`.`purchase_order_good`
    left join `fs_wms_warehouse`.`good_store` on(
      (
      `fs_wms_purchase`.`purchase_order_good`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
      )
    )
    )
    left join `fs_wms_purchase`.`supplier` on(
    (
      `fs_wms_purchase`.`purchase_order_good`.`supplierId` = `supplier`.`supplierId`
    )
    )
  )
  left join `fs_wms_purchase`.`good` on(
    (
    `fs_wms_purchase`.`purchase_order_good`.`goodId` = `good`.`goodId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_supplier_good
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_supplier_good` AS
select
  `supplier_good`.`id` AS `id`,
  `supplier_good`.`supplierId` AS `supplierId`,
  `supplier`.`supplierName` AS `supplierName`,
  `supplier`.`supplierType` AS `supplierType`,
  `supplier_good`.`goodId` AS `goodId`,
  `good`.`goodName` AS `goodName`,
  `good`.`goodDesc` AS `goodDesc`,
  `supplier_good`.`goodPriceRecent` AS `goodPriceRecent`,
  `supplier_good`.`remark` AS `remark`,
  `supplier_good`.`operation` AS `operation`,
  `supplier_good`.`operationByUserId` AS `operationByUserId`,
  `supplier_good`.`operationByUser` AS `operationByUser`,
  `supplier_good`.`operationAt` AS `operationAt`,
  `supplier_good`.`rowStatus` AS `rowStatus`
from
  (
  (
    `supplier_good`
    left join `supplier` on(
    (
      `supplier_good`.`supplierId` = `supplier`.`supplierId`
    )
    )
  )
  left join `good` on((`supplier_good`.`goodId` = `good`.`goodId`))
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view01_supplier_good_price_history
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view01_supplier_good_price_history` AS
select
  `supplier_good_price_history`.`id` AS `id`,
  `supplier_good_price_history`.`supplierId` AS `supplierId`,
  `supplier_good_price_history`.`goodId` AS `goodId`,
  `supplier_good_price_history`.`goodPrice` AS `goodPrice`,
  `supplier_good_price_history`.`remark` AS `remark`,
  `supplier_good_price_history`.`operation` AS `operation`,
  `supplier_good_price_history`.`operationByUserId` AS `operationByUserId`,
  `supplier_good_price_history`.`operationByUser` AS `operationByUser`,
  `supplier_good_price_history`.`operationAt` AS `operationAt`,
  `supplier`.`supplierName` AS `supplierName`,
  `good`.`goodName` AS `goodName`
from
  (
  (
    `supplier_good_price_history`
    join `supplier` on(
    (
      `supplier_good_price_history`.`supplierId` = `supplier`.`supplierId`
    )
    )
  )
  join `good` on(
    (
    `supplier_good_price_history`.`goodId` = `good`.`goodId`
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
  `jianghujs_inventory`.`user_dept`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `jianghujs_inventory`.`user_dept`.`deptId` AS `deptId`,
  `jianghujs_inventory`.`user_dept`.`roleName` AS `roleName`,
  `jianghujs_inventory`.`user_dept`.`operation` AS `operation`,
  `jianghujs_inventory`.`user_dept`.`operationByUserId` AS `operationByUserId`,
  `jianghujs_inventory`.`user_dept`.`operationByUser` AS `operationByUser`,
  `jianghujs_inventory`.`user_dept`.`operationAt` AS `operationAt`,
  `jianghujs_inventory`.`user_dept`.`id` AS `id`,
  `jianghujs_inventory`.`dept`.`deptName` AS `deptName`
from
  (
  (
    `jianghujs_inventory`.`user_dept`
    join `jianghujs_inventory`.`_view01_user` `_user` on(
    (
      `jianghujs_inventory`.`user_dept`.`userId` = `_user`.`userId`
    )
    )
  )
  join `jianghujs_inventory`.`dept` on(
    (
    `jianghujs_inventory`.`user_dept`.`deptId` = `jianghujs_inventory`.`dept`.`deptId`
    )
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view02_good_price_stock
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view02_good_price_stock` AS
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
  `fs_wms_basic`.`good`.`rowStatus` AS `rowStatus`,
  `fs_wms_basic`.`good`.`goodSuggestPrice` AS `goodSuggestPrice`,
  `gosc`.`supplierCount` AS `supplierCount`
from
  (
  (
    `fs_wms_basic`.`good`
    left join `fs_wms_warehouse`.`good_store` on(
    (
      `fs_wms_basic`.`good`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
    )
    )
  )
  left join `fs_wms_purchase`.`view01_good_of_supplier_count` `gosc` on(
    (`fs_wms_basic`.`good`.`goodId` = `gosc`.`goodId`)
  )
  );





# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: view02_purchase_order_good_store
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `view02_purchase_order_good_store` AS
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
  `supplier`.`supplierName` AS `supplierName`,
  `good`.`goodType` AS `goodType`,
  `good`.`goodCategory` AS `goodCategory`,
  `good`.`goodSuggestPrice` AS `goodSuggestPrice`,
  `gosc`.`supplierCount` AS `supplierCount`
from
  (
  (
    (
    (
      `fs_wms_purchase`.`purchase_order_good`
      left join `fs_wms_warehouse`.`good_store` on(
      (
        `fs_wms_purchase`.`purchase_order_good`.`goodId` = `fs_wms_warehouse`.`good_store`.`goodId`
      )
      )
    )
    left join `fs_wms_purchase`.`supplier` on(
      (
      `fs_wms_purchase`.`purchase_order_good`.`supplierId` = `supplier`.`supplierId`
      )
    )
    )
    left join `fs_wms_purchase`.`good` on(
    (
      `fs_wms_purchase`.`purchase_order_good`.`goodId` = `good`.`goodId`
    )
    )
  )
  left join `fs_wms_purchase`.`view01_good_of_supplier_count` `gosc` on(
    (
    `fs_wms_purchase`.`purchase_order_good`.`goodId` = `gosc`.`goodId`
    )
  )
  );





