module FeaturesService
  class << self
    
    def get_data_sismologica
      require 'uri'
      require 'net/http'
      require 'json'
      uri = URI('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson')
      response = Net::HTTP.get(uri)
      return JSON.parse(response)['features']
    end

    def renovar_bd
      features = self.get_data_sismologica
      features.each do |f|
        begin
          feat = Feature.new(type: 'Feature')
          feat.build_property(external_id: f['id'], magnitude: f['properties']['mag'].to_f, time: f['properties']['time'], mag_type: f['properties']['magType'], external_url: f['properties']['url'], feature_id: feat.id)
          feat.property.build_coordinate(longitude: f['geometry']['coordinates'][0].to_f, latitude: f['geometry']['coordinates'][1].to_f, attribute_id:feat.property.id)
          feat.save
        end
      end
    end  

  end
end