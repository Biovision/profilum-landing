class CreateProgramClicks < ActiveRecord::Migration[5.1]
  def up
    unless ProgramClick.table_exists?
      create_table :program_clicks do |t|
        t.timestamps
        t.references :program, foreign_key: true, null: false, on_update: :cascade, on_delete: :cascade
        t.references :agent, foreign_key: true, on_update: :cascade, on_delete: :nullify
        t.inet :ip
      end
    end
  end

  def down
    if ProgramClick.table_exists?
      drop_table :program_clicks
    end
  end
end
