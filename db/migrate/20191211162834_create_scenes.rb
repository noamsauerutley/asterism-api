class CreateScenes < ActiveRecord::Migration[6.0]
  def change
    create_table :scenes do |t|
      t.belongs_to :plot, null: false, foreign_key: true
      t.string :name
      t.text :summary

      t.timestamps
    end
  end
end
