-- MySQLの起動
mysql -u root -p //password:root

-- データベースの作成
-- create database データベース名
create database test;

-- データベースの一覧表示
show databases;

-- データベースの削除
-- drop databae データベース名
drop database test;

-- MySQLの終了
exit;


-- データベースの作成
create database member;

-- データベースの一覧表示
show databases;

-- 使用するデータベースを選ぶ
use member;

-- テーブルを見る
show tables;

-- テーブル作成
create table memberList (id int, name varchar(32), pass char(4));

-- テーブル構造を確認
desc memberList;

-- テストデータを挿入
insert into memberList (id, name, pass) values (1, 'user1', '1111');
insert into memberList (id, name, pass) values (2, 'user2', '2222');
insert into memberList (id, name, pass) values (3, 'user3', '3333');

-- テーブルのデータを表示
select * from memberList;

-- テーブルの削除
drop table memberList;


