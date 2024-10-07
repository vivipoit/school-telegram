feature 'student sees course list' do
  scenario 'sucessfully' do
    student = create(:user, :student)

    teacher1 = create(:user, :faculty, email_address: 'teacher1@teacher.com')
    course1 = create(:course, subject: 'the course you see', teacher: teacher1)
    create(:course_student, course: course1, student: student)

    teacher2 = create(:user, :faculty, email_address: 'teacher2@teacher.com')
    course2 = create(:course, subject: 'the course you do not', teacher: teacher2)
    create(:course_student, course: course2)

    sign_in student
    visit root_path

    expect(page).to have_css('h2', text: 'Courses')

    expect(page).to have_content('the course you see teacher1@teacher.com 1')

    expect(page).not_to have_content('the course you do not')
    expect(page).not_to have_content('teacher2@teacher.com')
  end
end
