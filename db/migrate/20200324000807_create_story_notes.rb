class CreateStoryNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :story_notes do |t|
      t.belongs_to :story, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
