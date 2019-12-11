class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
