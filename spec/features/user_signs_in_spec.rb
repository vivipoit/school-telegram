feature 'user signs in' do
  scenario 'sucessfully' do
    user = create(:user, email_address: 'this-user@email.com', role: :faculty)

    visit root_path

    fill_in 'email_address', with: user.email_address
    fill_in 'password', with: TEST_USER_PASSWORD
    click_on 'Sign in'

    within '.spec-header' do
      expect(page).to have_content('this-user@email.com')
      expect(page).to have_content('faculty')
      expect(page).to have_content('Sign out')
    end
  end
end
