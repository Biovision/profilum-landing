class ProgramClick < ApplicationRecord
  PER_PAGE = 20

  belongs_to :program, counter_cache: true
  belongs_to :agent, optional: true

  # @param [Integer] page
  def self.page_for_administration(page = 1)
    order('id desc').page(page).per(PER_PAGE)
  end
end
