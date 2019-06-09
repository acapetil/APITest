class Feature < ActiveRecord::Base
    has_one :property, class_name: 'Attribute'
end
