class Coordinate < ActiveRecord::Base
    validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
    validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
    belongs_to :property, foreign_key: "attribute_id", class_name:'Attribute'
end
