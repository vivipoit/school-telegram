feature 'administration creates Telegram group' do
  scenario 'sucessfully' do
    create(:course)

    sign_in create(:user, :administration)
    visit root_path

    click_on 'create telegram group'

    expect(page).to have_content('created')
    expect(page).to have_link('join telegram group')
  end
end
