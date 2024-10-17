class AddTelegramGroupLinkToCourse < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :telegram_group_link, :string
  end
end
