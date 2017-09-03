class CreateSubwayStations < ActiveRecord::Migration[5.1]
  def up
    unless SubwayStation.table_exists?
      create_table :subway_stations do |t|
        t.timestamps
        t.references :subway_line, foreign_key: true, on_update: :cascade, on_delete: :cascade
        t.integer :center_count, default: 0, null: false
        t.string :name, null: false
        t.string :slug, null: false
      end

    end
  end

  def down
    if SubwayStation.table_exists?
      drop_table :subway_stations
    end
  end
end
