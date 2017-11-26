require 'rails/generators'

module Tramway::Core::Generators
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer
      copy_file "/#{File.dirname __dir__}/generators/templates/initializers/simple_form.rb", 'config/initializers/simple_form.rb'
      copy_file "/#{File.dirname __dir__}/generators/templates/initializers/simple_form_bootstrap.rb", 'config/initializers/simple_form_bootstrap.rb'
    end
  end
end
