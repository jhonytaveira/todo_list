require 'rails_helper'

feature 'Step', js: true do
  scenario 'creates step' do
    create(:board)
    visit root_path

    select 'Todo list', from: 'board'

    click_link 'Criar etapa'

    fill_in 'Nome', with: 'Desenvolvimento'

    click_button 'Salvar'

    expect(page).to have_content 'Etapa criada com sucesso.'

    expect(page).to have_select 'board', selected: 'Todo list'

    within '.card-header' do
      expect(page).to have_content 'Desenvolvimento'
    end
  end

  scenario 'edit step' do
    create(:step)
    visit root_path

    select 'Todo list', from: 'board'

    within '.card-header' do
      click_link 'Editar etapa'
    end

    fill_in 'Nome', with: 'Produção'

    click_button 'Salvar'

    expect(page).to have_content 'Etapa atualizada com sucesso.'

    within '.card-header' do
      expect(page).to have_content 'Produção'
    end
  end
end
