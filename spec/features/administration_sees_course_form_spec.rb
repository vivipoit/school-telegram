feature 'administration sees course form' do
  scenario 'sucessfully' do
    _teacher1 = create(:user, :faculty, email_address: 'teacher1@teacher.com')
    _teacher2 = create(:user, :faculty, email_address: 'teacher2@teacher.com')
    student1 = create(:user, :student, email_address: 'student1@student.com')
    student2 = create(:user, :student, email_address: 'student2@student.com')

    sign_in create(:user, :administration)
    visit root_path

    expect(page).to have_css('h2', text: 'Create new course')

    expect(page).to have_field('Subject')

    expect(page).to have_select('Teacher', options: [ 'teacher1@teacher.com', 'teacher2@teacher.com' ])
    expect(page).to have_select('Teacher assistant', options: [ '', 'teacher1@teacher.com', 'teacher2@teacher.com' ])

    expect(page).to have_field("course_student_ids_#{student1.id}", type: 'checkbox')
    expect(page).to have_field("course_student_ids_#{student2.id}", type: 'checkbox')
  end
end
