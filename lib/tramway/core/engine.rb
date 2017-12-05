module Tramway
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Core
      I18n.available_locales = [:ru]
      I18n.default_locale = :ru
    end
  end
end
