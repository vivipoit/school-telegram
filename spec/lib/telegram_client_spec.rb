describe TelegramClient do
  describe '.create_group' do
    context 'when there are no errors' do
      it 'creates a group with title and link' do
        stub_request(:post, "http://www.telegram-client.com/").
          with(
            body: { group_title: 'Group Title', link_title: 'Link Title' }.to_json
          ).to_return(
            headers: {},
            status: 200,
            body: { group_title: 'Group Title', link_title: 'Link Title', invite_link: "http://t.me/link-key" }.to_json
          )

        group = TelegramClient.create_group('Group Title', 'Link Title')

        expect(group[:group_title]).to eq('Group Title')
        expect(group[:link_title]).to eq('Link Title')
      end
    end

    context 'when there are errors' do
      it 'logs error information' do
        allow(Faraday).to receive(:new).and_raise(Faraday::Error, 'some rescued error')
        allow(Rails.logger).to receive(:error).and_call_original

        _group = TelegramClient.create_group('not important', 'not important')

        expect(Rails.logger).to have_received(:error).with('TelegramClient error: some rescued error')
      end

      it 'returns an empty hash' do
        allow(Faraday).to receive(:new).and_raise(Faraday::Error, 'some rescued error')

        group = TelegramClient.create_group('not important', 'not important')

        expect(group).to eq({})
      end
    end
  end
end
