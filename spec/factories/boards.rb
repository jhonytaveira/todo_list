FactoryBot.define do
  factory :board do
    name { 'Todo list' }
    initialize_with { Board.find_or_create_by(name: name) }
  end
end
