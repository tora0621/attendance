# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|null: false|
|email|string|null: false|
|name|string|null: false|
|grade|integer||
|per_hour|integer||
### Association
- has_many :shifts

## shiftsテーブル
|Column|Type|Option|
|------|----|------|
|starts_at|time|null: false|
|expired_at|time|null: false|
|break_starts_at|time||
|break_expired_at|time||
### Association
- belongs_to :user


# ツール・ライブラリの名前
 
勤怠管理
 
## 簡単な説明
 
出勤管理
給料計算
扶養控除管理

 
## 機能
 
- 機能1
- 機能2
- 機能3
- ...
 
 
## 制作背景

飲食店経営している知人に頼み作成

## 使い方
 
1. 使い方
2. 使い方
3. 使い方
 
 
## テスト
 
1. 使い方
2. 使い方
3. 使い方
 
## デプロイ
 

 
## その他
 
その他その他その他その他
その他その他その他その他
その他その他その他その他
その他その他その他その他
 
## 作者
 

 
## ライセンス
 

