require 'rails_helper'

describe Board, type: :model do
  subject { create(:board) }

  context 'associations' do
    it { should have_many(:steps) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }

    it do
      should validate_uniqueness_of(:name)
    end
  end
end
