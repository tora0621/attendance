class Worker < ApplicationRecord
  enum status:{attendance: 1,un_attendance: 0,rest: 2}
  has_many :shifts

  def salary
    # shifts.start_at - shifts.end_at
    # per_hour * per_hour
    # sum2 = sum * worker.per_hour
  end
end
