class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :story, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
