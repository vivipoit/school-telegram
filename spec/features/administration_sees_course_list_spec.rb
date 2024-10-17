feature 'administration sees course list' do
  scenario 'sucessfully' do
    teacher1 = create(:user, :faculty, email_address: 'teacher1@teacher.com')
    course1 = create(:course, subject: 'math', teacher: teacher1)
    create(:course_student, course: course1)

    teacher2 = create(:user, :faculty, email_address: 'teacher2@teacher.com')
    course2 = create(:course, subject: 'history', teacher: teacher2, telegram_group_link: 'https://t.me/this-fun-link')
    create_list(:course_student, 25, course: course2)

    sign_in create(:user, :administration)
    visit root_path

    expect(page).to have_css('h2', text: 'Courses')

    expect(page).to have_content('math teacher1@teacher.com 1')
    expect(page).to have_button('create telegram group')
    expect(page).to have_content('history teacher2@teacher.com 25 join telegram group')
  end
end
