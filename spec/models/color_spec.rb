require 'rails_helper'

RSpec.describe Color, type: :model do
  # Association Tests
  it { should belong_to(:palette) }

  # Validation Tests
  it { should validate_presence_of(:hex_code) }
end
