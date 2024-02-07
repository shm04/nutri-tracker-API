class Diet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :calories, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ingredients, presence: true
  validates :method, presence: true
end
