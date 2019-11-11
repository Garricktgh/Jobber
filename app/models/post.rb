class Post < ApplicationRecord
  belongs_to :company

  has_many :status, :dependent => :delete_all
  has_many :message, :dependent => :delete_all

end