FactoryBot.define do
  factory :task do
    title { 'Adicionar testes de aceitação' }
    description { 'Adicionar testes de aceitação para cadastros de clientes.' }
    board
    step
  end
end
