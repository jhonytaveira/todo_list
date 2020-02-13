require 'rails_helper'

feature 'Task', js: true do
  before do
    visit root_path
  end

  scenario 'creates task' do
    create(:step)
    visit root_path

    select 'Todo list', from: 'board'

    click_link 'Adicionar task'

    fill_in 'Título', with: 'Adicionar testes'
    fill_in 'Descrição',
            with: 'Adicionar testes de aceitação para cadastros de clientes.'

    click_button 'Salvar'

    expect(page).to have_content 'Adicionar testes'
    expect(page).to have_content 'Task criada com sucesso.'
  end

  scenario 'show task' do
    create(:task)
    visit root_path

    select 'Todo list', from: 'board'

    click_link 'Ações'
    click_link 'Ver'

    expect(page).to have_content 'Título: Adicionar testes de aceitação'
    expect(page).to have_content 'Descrição: Adicionar testes de aceitação ' \
                                 'para cadastros de clientes.'
  end

  scenario 'edit task' do
    create(:task)
    visit root_path

    select 'Todo list', from: 'board'

    click_link 'Ações'
    click_link 'Editar'

    fill_in 'Título', with: 'Adicionar testes'
    fill_in 'Descrição', with: 'Adicionar testes de aceitação para ' \
    'cadastros de usuários.'

    click_button 'Salvar'

    expect(page).to have_content 'Adicionar testes'
    expect(page).to have_content 'Task atualizada com sucesso.'
  end

  scenario 'delete task' do
    create(:task)
    visit root_path

    select 'Todo list', from: 'board'

    click_link 'Ações'

    within '.card' do
      expect(page).to have_content 'Adicionar testes'
    end

    accept_alert do
      click_link 'Apagar'
    end

    expect(page).to have_content 'Task apagada com sucesso.'

    within '.card' do
      expect(page).to_not have_content 'Adicionar testes'
    end
  end
end
