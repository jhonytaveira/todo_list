require 'rails_helper'

describe Task, type: :model do
  subject { create(:task) }

  context 'associations' do
    it { should belong_to(:board) }
    it { should belong_to(:step) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:board_id) }
    it { should validate_presence_of(:step_id) }
  end
end
