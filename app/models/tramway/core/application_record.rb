module Tramway
  module Core
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
      audited
    end
  end
end
