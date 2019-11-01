class Wage < ApplicationRecord
  belongs_to :shift
  belongs_to :worker
end
