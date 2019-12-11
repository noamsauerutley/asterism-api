class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|
      t.belongs_to :story, null: false, foreign_key: true
      t.string :name
      t.text :summary

      t.timestamps
    end
  end
end
