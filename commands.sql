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


- 数値型
整数: int 小数: float など

- 文字列型
固定長: char() 可変長: varchar() テキスト(長い文字列): text

- 日付・時刻型
日付と時刻: datetime 日付: date 時刻: time


-- レコードの挿入と表示

-- テーブルをつくる
create table memberList (
	  id int,
	  name varchar(32),
	  password char(4)
	  
);

-- レコードの挿入
-- insert文
-- 1つのカラムにレコードを入れるとき
insert into テーブル名 (カラム名) values (挿入するレコード);
insert into memberList (id) values (1);

-- 複数のカラムにレコードを入れるとき
insert into テーブル名 (カラム1, カラム2) values (レコード1, レコード2);
insert into memberList (id, name, password) values (2, 'user2', '2222');

-- レコードの表示
-- select文
-- テーブルの全てのレコードを見る
select * from テーブル名;

-- 特定のカラムのレコードを見る
select カラム名 from テーブル名;
select id from memberList;


-- 主キー(primary key)
 -- 値の重複がない
 -- NULLが不可
create table memberList (
	id int primary key auto_increment,
	name varchar(32) default 'BLANK!',
	password char(4)

);

-- テストデータを入れる
insert into memberList (id ,name) values
(1, 'kashiwagi');

-- 同じidのレコードを入れる
insert into memberList (id ,name) values
(1, 'tanaka');

-- NULLを挿入する
insert into memberList (id) values (NULL);
