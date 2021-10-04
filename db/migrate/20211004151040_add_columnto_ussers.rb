class AddColumntoUssers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :validate_token, :string
    add_column :users, :validate_token_sent_at, :datetime
  end
end
