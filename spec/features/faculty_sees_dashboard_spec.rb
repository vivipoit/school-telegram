feature 'faculty sees dashboard' do
  scenario 'sucessfully' do
    sign_in create(:user, :faculty)

    visit root_path

    expect(page).to have_css('h1', text: 'Faculty Dashboard')
  end
end
