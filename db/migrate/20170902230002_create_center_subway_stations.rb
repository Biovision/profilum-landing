class CreateCenterSubwayStations < ActiveRecord::Migration[5.1]
  def up
    add_column :centers, :slug, :string unless column_exists? :centers, :slug
    add_column :centers, :image, :string unless column_exists? :centers, :image
    add_column :programs, :slug, :string unless column_exists? :programs, :slug

    unless CenterSubwayStation.table_exists?
      create_table :center_subway_stations do |t|
        t.timestamps
        t.references :center, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
        t.references :subway_station, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
      end
    end
  end

  def down
    if CenterSubwayStation.table_exists?
      drop_table :center_subway_stations
    end
  end
end
