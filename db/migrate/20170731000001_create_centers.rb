class CreateCenters < ActiveRecord::Migration[5.1]
  def up
    unless Center.table_exists?
      create_table :centers do |t|
        t.timestamps
        t.string :name, null: false
        t.string :url
        t.string :place
        t.integer :programs_count, limit: 2, default: 0, null: false
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
