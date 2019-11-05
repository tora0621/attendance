class Worker < ApplicationRecord
  enum status:{attendance: 1,un_attendance: 0,rest: 2}
  has_many :shifts
  has_many :wages, through: :shifts

  def fullname
    first_name + last_name
  end


  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  # validates :family_name,               presence: true, length: { minimum: 1, maximum: 10}
  # validates :first_name,                presence: true, length: { minimum: 1, maximum: 10}
  # validates :family_name_in_katakana,   presence: true, format: { 
  #                                       with: /\A[\p{katakana}ー－]+\z/, 
  #                                       message: "はカナ文字を入力してください" },
  #                                       length: { minimum: 1, maximum: 15}

  # validates :first_name_in_katakana,    presence: true, format: { 
  #                                       with: /\A[\p{katakana}ー－]+\z/, 
  #                                       message: "はカナ文字を入力してください" },
  #                                       length: { minimum: 1, maximum: 15}
  # validates :tel,                       presence: true, format: { with: VALID_PHONE_REGEX }, numericality: true, allow_blank: true
  # validates :email,                     presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGIX }
  # validates :post_number,               presence: true
  # validates :address,                   presence: true
  # validates :per_hour,                  
  
end
