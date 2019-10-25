class Worker < ApplicationRecord
  enum status:{attendance: 0,un_attendance: 1,rest: 2}
  has_many :shifts
end
