feature 'faculty sees course list' do
  scenario 'sucessfully' do
    teacher = create(:user, :faculty, email_address: 'teacher@teacher.com')

    create(:course, subject: 'a course you see', teacher: teacher, telegram_group_link: 'https://t.me/this-fun-link')
    create(:course, subject: 'another course you see', teacher_assistant: teacher)
    create(:course, subject: 'a course you do not')

    sign_in teacher
    visit root_path

    expect(page).to have_css('h2', text: 'Courses')

    expect(page).to have_content('a course you see teacher@teacher.com 0 join telegram group')
    expect(page).to have_content('another course you see')

    expect(page).not_to have_content('a course you do not')
    expect(page).not_to have_button('create telegram group')
  end
end
