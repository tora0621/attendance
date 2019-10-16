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
