class Tramway::Core::ApplicationDecorator
  def initialize(object)
    @object = object
  end

  def name
    object.try(:name) || object.title
  end

  class << self
    def list_attributes
      []
    end

    def decorate(object_or_array)
      if object_or_array.class.superclass == ActiveRecord::Relation
        decorated_array = object_or_array.map do |obj|
          new obj
        end
        Tramway::Core::ApplicationDecoratedCollection.new decorated_array, object_or_array
      else
        new object_or_array
      end
    end
  end

  delegate :id, to: :object

  def model
    object
  end

  protected
  
  def object
    @object
  end
end
