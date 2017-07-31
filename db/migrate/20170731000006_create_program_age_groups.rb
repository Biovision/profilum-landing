class CreateProgramAgeGroups < ActiveRecord::Migration[5.1]
  def up
    unless ProgramAgeGroup.table_exists?
      create_table :program_age_groups do |t|
        t.timestamps
        t.references :program, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
        t.references :age_group, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
      end
    end
  end

  def down
    if ProgramAgeGroup.table_exists?
      drop_table :program_age_groups
    end
  end
end
