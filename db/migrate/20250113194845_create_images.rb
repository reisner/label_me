class CreateImages < ActiveRecord::Migration[8.0]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.text :notes

      t.timestamps
    end
  end
end
