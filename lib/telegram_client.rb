class TelegramClient
  def self.create_group(group_title, link_title)
    response = connection.post(ENV["TELEGRAM_CLIENT_URL"]) do |request|
      request.body = { group_title:, link_title: }.to_json
    end

    JSON.parse(response.body, { symbolize_names: true })
  rescue StandardError => error
    Rails.logger.error "TelegramClient error: #{error}"

    {}
  end

  def self.connection
    Faraday.new(headers: { "Content-Type" => "application/json" })
  end
end
