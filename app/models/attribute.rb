class Attribute < ActiveRecord::Base
    validates :mag_type, :external_id, presence: true
    validates :magnitude, numericality: { greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
    validates :external_id, uniqueness: true
    belongs_to :feature, foreign_key: "feature_id"
    has_one :coordinate
end
