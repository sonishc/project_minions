require 'rails_helper'

RSpec.describe Toy, type: :model do
  context 'Factory validation' do
    let(:toy) { FactoryGirl.build :toy }

    it 'has a valid factory' do
      expect(toy).to be_valid
    end
  end

  context 'name presence' do
    let(:toy) { FactoryGirl.build :toy, name: nil }
    it 'is not valid without a name' do
      expect(toy).to_not be_valid
    end
  end

  context 'user presence' do
    let(:toy) { FactoryGirl.build :toy, user: nil }
    it 'is not valid without a user_id' do
      expect(toy).to_not be_valid
    end
  end

  context 'name length' do
    let(:toy) { FactoryGirl.build :toy, name: 'a' * 16 }
    it 'is invalid with a name length greater than 15' do
      expect(toy).to_not be_valid
    end
  end

  it { should validate_length_of :name }
end
