class Task < ApplicationRecord
  belongs_to :board
  belongs_to :step

  validates :title, :description, :board_id, :step_id, presence: true
end
