class CreatePlotNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :plot_notes do |t|
      t.belongs_to :plot, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
