class Palette < ApplicationRecord
  # model associations
  belongs_to :project

  # validations
  validates_presence_of :title
end
