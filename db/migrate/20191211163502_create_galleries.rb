class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.belongs_to :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
