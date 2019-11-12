class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all

  # validates :name, length: { minimum: 3, maximum: 50 }
  # validates :description, length: { minimum: 3, maximum: 300 }
end