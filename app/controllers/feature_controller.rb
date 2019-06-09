class FeatureController < ApplicationController

  def features_list
    params[:per_page] ? page_limit=params[:per_page].to_i : page_limit=25
    params[:current_page] ? page=params[:current_page].to_i : page=1 
    feats_filter_mag_type= Feature.filter_mag_type(params[:filters])
    feats=feats_filter_mag_type.feature_pagination(page,page_limit)

    feature_filter_hash = feats.map {|feat| { id: feat.id, type:'feature',attributes:{ external_id:feat.property.external_id, magnitude:feat.property.magnitude, time:feat.property.time, mag_type:feat.property.mag_type, external_url:feat.property.external_url, coordinates:{longitude:feat.property.coordinate.longitude, latitude:feat.property.coordinate.latitude }}} }
    @features_list_hash={ data: feature_filter_hash, pagination:{ current_page: page, total: feats_filter_mag_type.count, per_page: page_limit }}
    
    render json: @features_list_hash

  end
end
