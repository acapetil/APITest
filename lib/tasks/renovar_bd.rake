
#require './app/services/features_service.rb'
namespace :task do
    desc "Obtiene y persiste data sismologica desde fees 'Past 30 days' de el sitio USGS"
  
    task :renovar_bd => :environment do
      FeaturesService::renovar_bd
    end
end