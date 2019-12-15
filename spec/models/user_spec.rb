require 'rails_helper'

RSpec.describe User, type: :model do
  # Association tests
  it { should have_many(:projects).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
end
