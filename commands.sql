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


-- 自動連番(auto_increment)
drop table memberList;

create table memberList (
	id int primary key auto_increment,
	name varchar(32)

);

desc memberList;

insert into memberList (name) values
  ('kashiwagi'),
  ('tanaka'),
  ('suzuki');

insert into memberList (name) values
  ('sato');

-- デフォルト値
drop table memberList;

create table memberList (
	  id int primary key auto_increment,
	  name varchar(32) default 'BLANK!!!',
	  password char(4)
	  
);

desc memberList;

insert into memberList (password) values ('1111');

select * from memberList;

-- select文の練習
-- テーブルの作成
create table sales (
	 id int primary key auto_increment,
	 name varchar(32),
	 sale int,
	 created_at datetime
);

-- データの挿入
insert into sales (name, sale, created_at) values
  ('hokkaido', 150, '2015-01-01 12:00:00' ),
  ('tohoku',   200, '2015-02-01 12:00:00' ),
  ('kanto',    500, '2015-03-01 12:00:00' ),
  ('chubu',    300, '2015-04-01 12:00:00' ),
  ('kinki',    400, '2015-05-01 12:00:00' ),
  ('chugoku',  180, '2015-06-01 12:00:00' ),
  ('shikoku',  140, '2015-07-01 12:00:00' ),
  ('kyushu',   120, '2015-08-01 12:00:00' );

-- 特定のカラムだけ抽出
select id, name from sales;

-- レコードの件数を調べる
select count(sale) from sales;
select count(*) from sales;

-- エイリアス
-- 本物を参照するために勝手につけた名前
select id as '社員番号', sale as '売上' from sales;

-- 演算とエイリアス
select sale * 1000 from sales;
select sale * 1000 as '売上(円)' from sales;

-- 平均の算出
select avg(sale) as '売上平均(千円)' from sales;

-- 指定された条件のレコードを表示
-- limit
-- where
-- like

-- 表示件数の指定
select * from sales limit 4;

-- 売上が◯◯より大きい
-- where と 比較演算子を使う
select * from sales where sale > 150;
select name, sale from sales where sale > 200;

-- コンボ
select * from sales where sale > 150 limit 3;

-- 特定条件で検索
select * from sales where name = 'kanto';
select * from sales where id = 3;

-- あいまい検索 like
-- 売上が 100なんとか みたいな
select * from sales where sale like '2%';

-- 複数の条件指定
-- 売上が200以上かつ400未満(AND)
select * from sales where sale >= 200 and sale < 400;

-- 売上が200未満、または400以上
select * from sales where sale < 200 or sale >= 400;


-- 並べ替え
-- order by (desc asc)
-- limit offset

-- 売上の小さい順(昇順)に表示
select * from sales order by sale asc;

-- 売上の大きい順(降順)に表示
select * from sales order by sale desc;

-- 表示するレコードの範囲を決める
select * from sales order by sale desc limit 2 offset 3;
select * from sales order by sale desc limit 2 offset 4;


-- 削除
-- レコード全消し
delete from sales;

-- 再びテストレコード挿入
insert into sales (name, sale, created_at) values
  ('hokkaido', 150, '2015-01-01 12:00:00' ),
  ('tohoku',   200, '2015-02-01 12:00:00' ),
  ('kanto',    500, '2015-03-01 12:00:00' ),
  ('chubu',    300, '2015-04-01 12:00:00' ),
  ('kinki',    400, '2015-05-01 12:00:00' ),
  ('chugoku',  180, '2015-06-01 12:00:00' ),
  ('shikoku',  140, '2015-07-01 12:00:00' ),
  ('kyushu',   120, '2015-08-01 12:00:00' );

-- 条件を指定して削除
delete from sales where id = 12;
delete from sales where sale < 200;

-- 更新
-- UPDATE テーブル名 SET カラム名 = 値
update sales set name = 'HOKKAIDO' where id = 17;
