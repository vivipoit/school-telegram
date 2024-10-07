feature 'administration creates course' do
  scenario 'sucessfully' do
    _teacher1 = create(:user, :faculty, email_address: 'teacher1@teacher.com')
    _teacher2 = create(:user, :faculty, email_address: 'teacher2@teacher.com')
    student1 = create(:user, :student, email_address: 'student1@student.com')
    student2 = create(:user, :student, email_address: 'student2@student.com')

    sign_in create(:user, :administration)
    visit root_path

    fill_in 'Subject', with: 'math'
    select 'teacher1@teacher.com', from: 'Teacher'
    select 'teacher2@teacher.com', from: 'Teacher assistant'
    check "course_student_ids_#{student1.id}"
    check "course_student_ids_#{student2.id}"
    click_on "Create Course"

    expect(page).to have_content('created')
    expect(page).to have_content('math teacher1@teacher.com 2')
  end
end
