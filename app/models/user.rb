class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, foreign_key: "owner_id", dependent: :destroy
  has_many :comments, foreign_key: "owner_id", dependent: :destroy
  has_many :photos, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
