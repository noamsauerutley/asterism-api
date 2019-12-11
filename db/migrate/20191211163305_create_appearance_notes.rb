class CreateAppearanceNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :appearance_notes do |t|
      t.belongs_to :appearance, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
