class ProgramSchool < ApplicationRecord
  belongs_to :program
  belongs_to :school, counter_cache: :programs_count

  validates_uniqueness_of :school_id, scope: [:program_id]
end
