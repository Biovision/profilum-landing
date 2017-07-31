class ProgramAgeGroup < ApplicationRecord
  belongs_to :program
  belongs_to :age_group, counter_cache: :programs_count

  validates_uniqueness_of :age_group_id, scope: [:program_id]
end
