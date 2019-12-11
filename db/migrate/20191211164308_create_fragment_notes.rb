class CreateFragmentNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :fragment_notes do |t|
      t.belongs_to :fragment, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
