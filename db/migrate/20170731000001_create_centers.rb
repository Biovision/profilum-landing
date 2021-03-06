class CreateCenters < ActiveRecord::Migration[5.1]
  def up
    unless Center.table_exists?
      create_table :centers do |t|
        t.timestamps
        t.string :name, null: false
        t.string :slug
        t.string :image
        t.string :url
        t.string :place
        t.integer :programs_count, limit: 2, default: 0, null: false
        t.float :latitude
        t.float :longitude
      end

      Privilege.create(slug: 'program_manager', name: 'Управляющий программами')
    end
  end

  def down
    if Center.table_exists?
      drop_table :centers
    end
  end
end
