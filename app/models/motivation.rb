class Motivation < ActiveRecord::Base
  belongs_to :goal

  validates :title, :source, presence: true
end
