class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, foreign_key: "owner_id"
  has_many :comments, foreign_key: "owner_id"

  mount_uploader :photo, PhotoUploader
end
