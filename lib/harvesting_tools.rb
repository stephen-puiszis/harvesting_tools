require 'bundler/setup'
Bundler.require(:default)
require './lib/exporter.rb'
require 'date'
require 'yaml'

module Harvesting
  include Exporter

  class Tools
    include Harvest

    attr_accessor :client, :config, :timesheets, :missing_descriptions, :params

    def self.configure
      s = YAML.load(File.open('config.yml', 'r'))
      @config = { subdomain: s['subdomain'], username: s['username'], password: s['password'] }
    end

    def self.client
      @client || Harvest.client(self.config)
    end

    def self.config
      @config || configure
    end

    def self.fetch_missing_descriptions(params = {})
      fetch_timesheets(params)
      @missing_descriptions = @timesheets.select { |t| t.notes.nil?  }
    end

    def self.fetch_timesheets(params = {})
      if params.empty?
        end_date, start_date = Date.today, Date.today - 30
      else
        params = params.inject({}) do |memo, v|
          vals = v.split("=")
          memo[vals[0].gsub('--', '').to_sym] = vals[1]
          memo
        end

        end_date, start_date = Date.parse(params[:end]), Date.parse(params[:start])
      end
      @timesheets = (start_date..end_date).map { |d| fetch_timesheet(d) }.flatten
    end

    def self.fetch_timesheet(date)
      client.time.all(date)
    end
  end
end
