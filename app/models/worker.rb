class Worker < ApplicationRecord
  enum status:{attendance: 1,un_attendance: 0,rest: 2}
  has_many :shifts
end
