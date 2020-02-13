class Step < ApplicationRecord
  belongs_to :board

  has_many :tasks

  validates :name, :board_id, presence: true
  validates :name,
            uniqueness: {
              scope: :board_id,
              message: I18n.t(
                'activerecord.errors.models.step.name.unique_by_board'
              )
            }
end
