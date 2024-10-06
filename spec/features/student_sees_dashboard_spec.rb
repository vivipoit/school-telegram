feature 'student sees dashboard' do
  scenario 'sucessfully' do
    sign_in create(:user, :student)

    visit root_path

    expect(page).to have_css('h1', text: 'Student Dashboard')
  end
end
