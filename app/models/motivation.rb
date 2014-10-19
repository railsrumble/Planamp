class Motivation < ActiveRecord::Base
  belongs_to :goal

  validates :title, :source, presence: true

  def source_is_url?
    source['http://'].present?
  end
end
