class Category < ActiveRecord::Base
  has_many :goals

  validates :name, presence: true

  scope :weighted, -> { order('weight asc') }
end
