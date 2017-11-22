require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe 'creation' do
    it 'can be created if valid' do
      expect(user).to be_valid
    end

    it 'will not be created if not valid' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  it { should validate_presence_of :age }
  it { should validate_presence_of :sex }
  it { should validate_numericality_of(:age) }
  it { should_not allow_value(-1).for(:age) }
  it { should allow_value(6).for(:age) }
end
