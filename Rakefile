require './lib/harvesting_tools.rb'

desc 'Find your missing Harvest descriptions'
namespace :time do
  task :missing_descriptions do
    puts 'Finding your missing Harvest Descriptions...'
    params = ARGF.argv.inject({}) do |memo, v|
      vals = v.split("=")
      memo[vals[0].gsub('--', '').to_sym] = vals[1]
      memo
    end
    data = Harvesting::Tools.fetch_missing_descriptions(ARGF.argv)
    Exporter.export_text(data)
    Exporter.export_csv(data, 'missing-entries')
  end

  task :export do
    puts 'Exporting your Harvest timesheets'

    data = Harvesting::Tools.fetch_timesheets(ARGF.argv)
    Exporter.export_csv(data, 'export')
  end
end
