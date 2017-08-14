module ProgramsHelper
  # @param [AgeGroup] entity
  def admin_age_group_link(entity)
    link_to(entity.name, admin_age_group_path(entity.id))
  end

  # @param [Center] entity
  def admin_center_link(entity)
    link_to(entity.name, admin_center_path(entity.id))
  end

  # @param [Program] entity
  def admin_program_link(entity)
    link_to(entity.name, admin_program_path(entity.id))
  end

  # @param [School] entity
  def admin_school_link(entity)
    link_to(entity.name, admin_school_path(entity.id))
  end

  # @param [Program] entity
  def program_link(entity, text = entity.name, options = {})
    html_options = { target: '_blank' }.merge(options)
    link_to(text, program_path(entity.id), html_options)
  end

  def centers_for_select
    Center.ordered_by_name.map { |c| [c.name, c.id] }
  end

  # @param [Program] entity
  def program_image_preview(entity)
    return '' if entity.image.blank?
    versions = "#{entity.image.preview_2x.url} 2x"
    image_tag(entity.image.preview.url, alt: entity.name, srcset: versions)
  end

  # @param [Program] entity
  def program_image_medium(entity)
    return '' if entity.image.blank?
    versions = "#{entity.image.medium_2x.url} 2x"
    image_tag(entity.image.medium.url, alt: entity.name, srcset: versions)
  end

  # @param [Program] entity
  def program_image_small(entity)
    return '' if entity.image.blank?
    versions = "#{entity.image.medium.url} 2x"
    image_tag(entity.image.small.url, alt: entity.name, srcset: versions)
  end
end
