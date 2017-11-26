module Tramway
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Core
    end
  end
end
