class Project < ApplicationRecord
  # model associations
  belongs_to :user
  has_many :palettes, dependent: :destroy

  # validations
  validates_presence_of :title, :description
end
