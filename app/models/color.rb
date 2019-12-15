class Color < ApplicationRecord
  belongs_to :palette

  validates_presence_of :hex_code
end
