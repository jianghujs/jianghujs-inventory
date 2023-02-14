# fs_wms_purchase

## 配置

1. npm install
2. 复制 `config.local.example.js` 为 `config.local.js`
3. 并且修改数据库配置为自己的数据库, 例如：
   ```
   host: '127.0.0.1',
   port: 3306,
   user: 'root',
   password: '123456',
   database: 'fs_wms_purchase'
   ```
4. 启动 npm run dev
   
## 数据库

```sql
# 数据库初始化
create database `fs_wms_purchase` default character set utf8mb4 collate utf8mb4_bin;
use fs_wms_purchase;
# 运行 sql/init.sql 文件
```

