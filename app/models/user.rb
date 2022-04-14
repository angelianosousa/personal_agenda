class User < ApplicationRecord
  # Callback
  after_create :build_profile

  # Associations
  has_one :user_profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def build_profile
    UserProfile.create! user_id: self.id, fullname: ""
  end
  
end
