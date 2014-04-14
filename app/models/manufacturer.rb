class Manufacturer < ActiveRecord::Base

  has_many :cars, dependent: :nullify

  validates :name, presence: true, format: { with: /[a-z]+/i }
  validates :country, presence: true, format: { with: /[a-z]+/i }

end
