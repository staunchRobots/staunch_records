class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_picture,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    path: ":rails_root/public/system/:attachment/:id/:style/:filename",
                    url: "/system/:attachment/:id/:style/:filename"

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday, :country, :profile_picture

  validates_presence_of :email, :password, :password_confirmation
  validates_uniqueness_of :email
end
