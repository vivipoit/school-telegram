feature 'user sees dashboard' do
  scenario 'sucessfully' do
    sign_in

    visit root_path

    expect(page).to have_css('h1', text: 'Dashboard')
  end
end
