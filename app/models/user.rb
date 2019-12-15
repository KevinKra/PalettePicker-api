class User < ApplicationRecord
  # model associations
  has_many :projects, dependent: :destroy

  # validations
  validates_presence_of :username, :password
end
