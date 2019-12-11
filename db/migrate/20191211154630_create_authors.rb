class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :image_url
      t.text :bio

      t.timestamps
    end
  end
end
