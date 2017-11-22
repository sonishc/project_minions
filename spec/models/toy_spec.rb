require 'rails_helper'

RSpec.describe Toy, type: :model do
  let(:toy) { FactoryGirl.create(:toy) }

  describe 'creation' do
    it 'can be created if valid' do
      expect(toy).to be_valid
    end

    it 'will not be created if not valid' do
      toy.name = nil
      expect(toy).to_not be_valid
    end
  end

  it { should validate_presence_of :name }
  it { should validate_length_of :name }
end
