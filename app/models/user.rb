class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :investments

  mount_uploader :photo, PhotoUploader

  acts_as_token_authenticatable

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
