namespace :import do
  desc "TODO"
  task comps: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "competitions_info.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Competition.new

      c.name = row["Name"]
      c.sponsor = row["Sponsor"]
      c.location = row["Location"]
      c.description = row["Description"]
      c.prize_money = row["Prize Money"]
      c.topic = row["Topic"]
      c.deadline = row["Deadline"]
      c.save
      puts "#{c.name} saved"

    end
    puts "There are now #{Competition.count} rows in the competitions table"
  end
end
