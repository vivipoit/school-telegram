describe CourseService::CreateTelegramGroup do
  describe '.call' do
    it 'does not create a group for a course with a link' do
      allow(TelegramClient).to receive(:create_group).and_call_original
      course = create(:course, telegram_group_link: 'https://t.me/a-link-is-here')
      create_group = CourseService::CreateTelegramGroup.new(course)

      expect(create_group.call).to eq(false)
      expect(TelegramClient).not_to have_received(:create_group)
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
