class CreateProgramSchools < ActiveRecord::Migration[5.1]
  def up
    unless ProgramSchool.table_exists?
      create_table :program_schools do |t|
        t.timestamps
        t.references :program, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
        t.references :school, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
      end
    end
  end

  def down
    if ProgramSchool.table_exists?
      drop_table :program_schools
    end
  end
end
