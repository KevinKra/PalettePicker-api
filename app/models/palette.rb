class Palette < ApplicationRecord
  # model associations
  belongs_to :project
  has_many :colors

  # validations
  validates_presence_of :title
end
