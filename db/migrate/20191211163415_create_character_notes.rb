class CreateCharacterNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :character_notes do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
