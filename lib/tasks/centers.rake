require 'fileutils'

namespace :centers do
  desc 'Load centers from YAML with deleting old data'
  task load: :environment do
    file_path = "#{Rails.root}/tmp/import/centers.yml"
    media_dir = "#{Rails.root}/tmp/import/centers"
    ignored   = %w(image)
    if File.exist?(file_path)
      puts 'Deleting old centers...'
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
      Program.connection.execute "select setval('centers_id_seq', (select max(id) from centers));"
      puts "Done. We have #{Program.count} centers now"
    else
      puts "Cannot find file #{file_path}"
    end
  end

  desc 'Dump centers to YAML'
  task dump: :environment do
    file_path = "#{Rails.root}/tmp/export/centers.yml"
    media_dir = "#{Rails.root}/tmp/export/centers"
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

  task set_coordinates: :environment do
    file_name = "#{Rails.root}/tmp/coordinates.txt"
    if File.exists?(file_name)
      pattern = /\d+\.\d+/
      File.open(file_name, 'rb').each_line do |line|
        chunks = line.strip.split('/')
        slug   = chunks.first

        longitude, latitude = chunks.last(2)
        if latitude =~ pattern && longitude =~ pattern
          print "\r#{slug} "
          center = Center.find_by(slug: slug)
          if center.nil?
            print ' (nil) '
          else
            print " (#{center.id}) "
            center.update!(latitude: Float(latitude), longitude: Float(longitude))
          end
        end
      end
      puts
    else
      puts "File #{file_name} does not exist"
    end
  end
end
