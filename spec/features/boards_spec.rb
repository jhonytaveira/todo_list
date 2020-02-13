require 'rails_helper'

feature 'Board', js: true do
  before do
    visit root_path
  end

  scenario 'creates board' do
    expect(page).to have_content 'Selecione ou crie um board.'
    expect(page).to_not have_link 'Criar etapa'

    click_link 'Criar board'

    fill_in 'Nome', with: 'Todo list'

    click_button 'Salvar'

    expect(page).to have_content 'Board criado com sucesso'
    expect(page).to have_select 'board', selected: 'Todo list'
    expect(page).to have_link 'Criar etapa'

    expect(page).to_not have_content 'Selecione ou crie um board.'
  end
end
