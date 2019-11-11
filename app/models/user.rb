class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :status
  has_many :message

  validates :name, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 3, maximum: 300 }
end