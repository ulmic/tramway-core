module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def submit(params)
      raise 'ApplicationForm::Params should not be nil'.inspect unless params
      save if validate params
    end
  end
end
