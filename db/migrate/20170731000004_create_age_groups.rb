class CreateAgeGroups < ActiveRecord::Migration[5.1]
  def up
    unless AgeGroup.table_exists?
      create_table :age_groups do |t|
        t.timestamps
        t.integer :programs_count, default: 0, null: false
        t.integer :priority, limit: 2, default: 1, null: false
        t.string :name, null: false
      end

      seed_age_groups
    end
  end

  def down
    if AgeGroup.table_exists?
      drop_table :age_groups
    end
  end

  def seed_age_groups
    AgeGroup.create(name: '0+')
    AgeGroup.create(name: '4–6')
    AgeGroup.create(name: '7–10')
    AgeGroup.create(name: '11–13')
    AgeGroup.create(name: '14–16')
    AgeGroup.create(name: '16+')
  end
end
