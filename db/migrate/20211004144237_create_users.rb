class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.string :cellphone
      t.string :nickname

      t.timestamps
    end
  end
end
