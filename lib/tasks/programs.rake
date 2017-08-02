require 'fileutils'

namespace :programs do
  desc 'Load programs from YAML with deleting old data'
  task load: :environment do
    file_path = "#{Rails.root}/tmp/import/programs.yml"
    media_dir = "#{Rails.root}/tmp/import/programs"
    ignored   = %w(image)
    if File.exist?(file_path)
      puts 'Deleting old programs...'
      Program.destroy_all
      puts 'Done. Importing...'
      File.open(file_path, 'r') do |file|
        YAML.load(file).each do |id, data|
          attributes = data.reject { |key| ignored.include? key }
          entity     = Program.new(id: id)
          entity.assign_attributes(attributes)
          if data.key?('image')
            image_file = "#{media_dir}/#{id}/#{data['image']}"
            if File.exist?(image_file)
              entity.image = Pathname.new(image_file).open
            end
          end
          entity.save!

          print "\r#{id}    "
        end
        puts
      end
      Program.connection.execute "select setval('programs_id_seq', (select max(id) from programs));"
      puts "Done. We have #{Program.count} programs now"
    else
      puts "Cannot find file #{file_path}"
    end
  end

  desc 'Dump programs to YAML'
  task dump: :environment do
    file_path = "#{Rails.root}/tmp/export/programs.yml"
    media_dir = "#{Rails.root}/tmp/export/programs"
    ignored   = %w(id image)
    Dir.mkdir(media_dir) unless Dir.exist?(media_dir)
    File.open(file_path, 'w') do |file|
      Program.order('id asc').each do |entity|
        print "\r#{entity.id}    "
        file.puts "#{entity.id}:"
        entity.attributes.reject { |a, v| ignored.include?(a) || v.nil? }.each do |attribute, value|
          file.puts "  #{attribute}: #{value.inspect}"
        end

        unless entity.image.blank?
          image_name = File.basename(entity.image.path)
          Dir.mkdir("#{media_dir}/#{entity.id}") unless Dir.exist?("#{media_dir}/#{entity.id}")
          FileUtils.copy(entity.image.path, "#{media_dir}/#{entity.id}/#{image_name}")
          file.puts "  image: #{image_name.inspect}"
        end
      end
      puts
    end
  end
end
