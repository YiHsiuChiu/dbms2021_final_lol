# 資料庫建置檔案

## 建置順序
1. create_table.sql
2. region.csv
3. team.csv
4. player.csv
5. 透過sql 建立 admin 帳號密碼 (INSERT app_user table)
6. 透過sql或api 建立至少一場game與vote (table內需有資料app才run得起來)
