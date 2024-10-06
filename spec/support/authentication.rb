def sign_in(user = create(:user))
  visit root_path

  fill_in 'email_address', with: user.email_address
  fill_in 'password', with: TEST_USER_PASSWORD
  click_on 'Sign in'

  assert_selector 'h1'
end
