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
  delegate :class, to: :object

  def model
    object
  end

  def attributes
    object.attributes.reduce({}) do |hash, attribute|
      if attribute[0].to_s.in? object.class.state_machines.keys.map(&:to_s)
        hash.merge! attribute[0] => object.send("human_#{attribute[0]}_name")
      elsif attribute[1].class.in? [ ActiveSupport::TimeWithZone, DateTime, Time ]
        hash.merge! attribute[0] => I18n.l(attribute[1])
      else
        hash.merge! attribute[0] => attribute[1]
      end
    end
  end

  protected
  
  def object
    @object
  end
end
