module Tramway
  module Core
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
