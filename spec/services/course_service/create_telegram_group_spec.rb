describe CourseService::CreateTelegramGroup do
  describe '.call' do
    it 'does not create a group for a course with a link' do
      allow(TelegramClient).to receive(:create_group).and_call_original
      course = create(:course, telegram_group_link: 'https://t.me/a-link-is-here')
      create_group = CourseService::CreateTelegramGroup.new(course)

      expect(create_group.call).to eq(false)
      expect(TelegramClient).not_to have_received(:create_group)
    end

    it 'generates group and link titles based on course information' do
      allow(TelegramClient).to receive(:create_group).and_return({ something: 'irrelevant' })
      allow(DateTime).to receive(:current).and_return('2024-10-31T23:59:59+00:00')
      teacher = create(:user, :faculty, email_address: 'this-teacher@faculty.com')
      course = create(:course, id: 549, subject: 'PE', teacher: teacher)

      CourseService::CreateTelegramGroup.new(course).call

      expect(TelegramClient).to have_received(:create_group).with('#549 PE this-teacher@faculty.com', '#549 2024-10-31T23:59:59+00:00')
    end

    it 'returns false when TelegramClient returns empty hash' do
      allow(TelegramClient).to receive(:create_group).and_return({})
      course = create(:course)
      create_group = CourseService::CreateTelegramGroup.new(course)

      expect(create_group.call).to eq(false)
    end

    it 'updates the record with the invite link when successful' do
      allow(TelegramClient).to receive(:create_group).and_return({ invite_link: 'https://t.me/a-link-is-here' })
      course = create(:course)
      create_group = CourseService::CreateTelegramGroup.new(course)

      expect(create_group.call).to eq(true)
      expect(course.reload.telegram_group_link).to eq('https://t.me/a-link-is-here')
    end
  end
end
