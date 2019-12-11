class CreateFragments < ActiveRecord::Migration[6.0]
  def change
    create_table :fragments do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.text :title
      t.text :text

      t.timestamps
    end
  end
end
