class Feature < ActiveRecord::Base
    
    has_one :property, class_name: 'Attribute'
    has_many :comments

    def self.filter_mag_type(params)
        Feature.joins(:property).where(:attributes =>{mag_type:params})
    end

    def self.feature_pagination(page=1,limit)
        Feature.limit(limit).offset((page-1)*limit)
    end
end


