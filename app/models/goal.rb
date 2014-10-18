class Goal < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :title, :user, :category, presence: true
  delegate :name, to: :user, prefix: true

  scope :available_for_all, -> { where(shared: true).where(approved: true) }
end
