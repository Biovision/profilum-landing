class CreatePrograms < ActiveRecord::Migration[5.1]
  def up
    unless Program.table_exists?
      create_table :programs do |t|
        t.timestamps
        t.references :center, foreign_key: true, on_update: :cascade, on_delete: :cascade
        t.integer :price, default: 0, null: false
        t.integer :old_price
        t.boolean :visible, default: true, null: false
        t.boolean :use_discount, default: false, null: false
        t.string :image
        t.string :name, null: false
        t.string :url
        t.string :lead
        t.string :ages
      end
    end
  end

  def down
    if Program.table_exists?
      drop_table :programs
    end
  end
end
