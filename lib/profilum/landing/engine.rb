module Profilum
  module Landing
    class Engine < ::Rails::Engine
      config.assets.precompile << %w(admin.scss)
      config.assets.precompile << %w(biovision/base/icons/*)
      config.assets.precompile << %w(biovision/base/placeholders/*)
    end

    require 'biovision/base'
  end
end
