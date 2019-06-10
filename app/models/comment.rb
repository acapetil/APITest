class Comment < ActiveRecord::Base
    belongs_to :feature, foreign_key: "feature_id"
    validate :validate_feature, on: :create
    def validate_feature
        if feature.nil?
            errors.add(:feature_id, "No existe Feature asociado a este Comment")
        end
    end
end
