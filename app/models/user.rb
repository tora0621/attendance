class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name,                 presence: true
  validates :email,                presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGIX }
  validates :password,             presence: true, length: { minimum: 6, maximum: 20}
end
