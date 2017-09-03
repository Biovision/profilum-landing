class CreateSubwayLines < ActiveRecord::Migration[5.1]
  def up
    unless SubwayLine.table_exists?
      create_table :subway_lines do |t|
        t.timestamps
        t.integer :priority, limit: 2, default: 1, null: false
        t.integer :subway_stations_count, default: 0, null: false
        t.string :name, null: false
        t.string :slug, null: false
      end
    end
  end

  def down
    if SubwayLine.table_exists?
      drop_table :subway_lines
    end
  end
end
