class Car < ActiveRecord::Base

  belongs_to :manufacturer

  validates :color, presence: true, format: { with: /[a-z]+/i }
  validates :year, presence: true, inclusion: { in: 1980..2014 }
  validates :mileage, presence: true, numericality: { only_integer: true }

end
