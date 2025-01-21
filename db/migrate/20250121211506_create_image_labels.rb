class CreateImageLabels < ActiveRecord::Migration[8.0]
  def change
    create_table :image_labels do |t|
      t.string :label_name
      t.integer :left
      t.integer :top
      t.integer :width
      t.integer :height
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
