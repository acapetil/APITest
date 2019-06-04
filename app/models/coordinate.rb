class Coordinate < ActiveRecord::Base
    belongs_to :attribute, foreign_key: "attribute_id"
end
