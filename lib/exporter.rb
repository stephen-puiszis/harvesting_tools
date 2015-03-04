require 'csv'
require 'date'

module Exporter
  def self.export_text(entries)
    entries.each {|t| Exporter.create_and_print_entry(t) }
  end

  def self.export_csv(entries, filename)
    CSV.open("data/#{filename}-#{Date.today.to_s}.csv", "w") do |csv_data|
      headers = ['spent_at', 'project_id', 'project', 'client', 'hours', 'notes']
      csv_data << headers
      entries.each { |r| csv_data << Exporter.format_rows(r) }
    end
  end

  def self.create_and_print_entry(harvest_entry)
    string = <<-STRING
    ---------------------------------------------------
    Date:      #{Date.parse(harvest_entry.created_at).strftime("%b %d, %Y")}
    Client:    #{harvest_entry.client}
    Task:      #{harvest_entry.task}
    Hours:     #{harvest_entry.hours}
    Desc:      #{harvest_entry.notes}
    STRING
    puts string
  end

  def self.format_rows(data)
    [
      data["spent_at"].strftime("%b %d, %Y"),
      data["project_id"],
      data["project"],
      data["client"],
      data["hours"],
      data["notes"]
    ]
  end
end
