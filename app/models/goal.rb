class Goal < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :motivations

  accepts_nested_attributes_for :motivations

  validates :title, :user, :category, presence: true
  delegate :name, to: :user, prefix: true

  scope :available_for_all, -> { where(shared: true).where(approved: true) }
end
