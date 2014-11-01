class Goal < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :motivations
  has_many :goal_in_lists
  has_many :goal_lists, through: :goal_in_lists

  accepts_nested_attributes_for :motivations

  validates :title, :user, :category, :motivations, presence: true
  delegate :name, to: :user, prefix: true

  scope :available_for_all, -> { where(shared: true).where(approved: true) }

  after_create :add_to_user_goal_list

  delegate :name, to: :category, prefix: true
  delegate :name, to: :user, prefix: true


  def motivations_attributes=(attrs)
    source_or_title = attrs.find_all{|k,v| (v[:source] + v[:title]).present?}
    not_empty_attrs = Hash[source_or_title]
    super(not_empty_attrs)
  end

  def share!
    update_attribute(:shared, true)
  end

  def disapprove!
    update_attribute(:approved, false)
  end


  protected


  def add_to_user_goal_list
    user.goal_list.add_goal(self) unless user.admin?
  end
end
