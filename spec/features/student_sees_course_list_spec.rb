feature 'student sees course list' do
  scenario 'sucessfully' do
    student = create(:user, :student)

    teacher1 = create(:user, :faculty, email_address: 'teacher1@teacher.com')
    course1 = create(:course, subject: 'the course you see', teacher: teacher1, telegram_group_link: 'https://t.me/this-fun-link')
    create(:course_student, course: course1, student: student)

    course2 = create(:course, subject: 'another course you see')
    create(:course_student, course: course2, student: student)

    teacher3 = create(:user, :faculty, email_address: 'teacher3@teacher.com')
    course3 = create(:course, subject: 'the course you do not see', teacher: teacher3)
    create(:course_student, course: course3)

    sign_in student
    visit root_path

    expect(page).to have_css('h2', text: 'Courses')

    expect(page).to have_content('the course you see teacher1@teacher.com 1 join telegram group')
    expect(page).to have_content('another course you see')

    expect(page).not_to have_content('the course you do not see')
    expect(page).not_to have_content('teacher3@teacher.com')
    expect(page).not_to have_button('create telegram group')
  end
end
