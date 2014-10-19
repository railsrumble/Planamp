class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:github, :twitter]

  has_many :goals    # Goals which created by user
  has_one :goal_list # Goals to be done

  delegate :goal_in_lists, to: :goal_list

  def goal_list
    super || build_goal_list.save!
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "email-#{SecureRandom.uuid}@example.com"
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

end
