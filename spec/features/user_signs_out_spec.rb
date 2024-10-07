feature 'user signs out' do
  scenario 'sucessfully' do
    sign_in

    click_on 'Sign out'

    expect(page).to have_css('h1', text: 'School Telegram')
  end
end
