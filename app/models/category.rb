class Category < ActiveRecord::Base
  has_many :goals
  has_many :available_goals, -> { available_for_all }, class_name: "Goal"

  validates :name, presence: true

  scope :weighted, -> { order('weight asc') }
end
