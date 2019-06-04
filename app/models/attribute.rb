class Attribute < ActiveRecord::Base
    belongs_to :feature, foreign_key: "feature_id"
    has_one :coordinate
end
