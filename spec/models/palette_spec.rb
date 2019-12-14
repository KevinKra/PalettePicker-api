require 'rails_helper'

RSpec.describe Palette, type: :model do
  # Association Tests
  it { should belong_to(:project) }

  # Validation Tests
  it { should validate_presence_of(:title) }
end
