class ProgramClick < ApplicationRecord
  PER_PAGE = 25

  belongs_to :program, counter_cache: true
  belongs_to :agent, optional: true

  scope :since, ->(date) { where('date(created_at) >= date(?)', date.to_date) }
  scope :before, ->(date) { where('date(created_at) <= date(?)', date.to_date) }
  scope :today, -> { where('date(created_at) = date(now())') }
  scope :this_week, -> { since(1.week.ago).before(Time.now.to_date) }
  scope :this_month, -> { since(1.month.ago).before(Time.now.to_date) }

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    order('id desc').page(page).per(PER_PAGE)
  end

  def name
    program.name
  end
end
