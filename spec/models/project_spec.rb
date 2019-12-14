require 'rails_helper'

RSpec.describe Project, type: :model do
  # Association Tests
  it { should have_many(:palettes).dependent(:destroy) }
  it { should belong_to(:user) }

  # Validation Tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
