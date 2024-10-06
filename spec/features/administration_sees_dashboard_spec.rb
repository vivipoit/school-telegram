feature 'administration sees dashboard' do
  scenario 'sucessfully' do
    sign_in create(:user, :administration)

    visit root_path

    expect(page).to have_css('h1', text: 'Administration Dashboard')
  end
end
