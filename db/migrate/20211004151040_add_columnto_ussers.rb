class AddColumntoUssers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :validate_token, :string
    add_column :users, :password_digest, :string
    add_column :users, :email_confirmed, :boolean, :default => false
    #Ex:- :default =>''
    add_column :users, :validate_token_sent_at, :datetime
  end
end
