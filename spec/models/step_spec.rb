require 'rails_helper'

describe Step, type: :model do
  subject { create(:step) }

  context 'associations' do
    it { should belong_to(:board) }

    it { should have_many(:tasks) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:board_id) }

    it do
      should validate_uniqueness_of(:name)
        .scoped_to(:board_id).with_message('Já existe este step para o board.')
    end
  end
end
