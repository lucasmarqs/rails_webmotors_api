namespace :webmotors_static_data do
  task all: [:makes, :models]

  task :makes => :environment do
    puts "Creating makes..."
    Webmotors::MakesExchange.new.save
  end

  task :models => :environment do
    puts "Creating models..."
    Make.all.each do |make|
      Webmotors::ModelsExchange.new(make).save
    end
  end
end
