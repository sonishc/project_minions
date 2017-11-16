require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :age }
  it { should validate_presence_of :sex }
  it { should validate_numericality_of(:age) }
  it { should_not allow_value(-1).for(:age) }
  it { should allow_value(6).for(:age) }
end
