class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.text :image_url
      t.text :note

      t.timestamps
    end
  end
end
