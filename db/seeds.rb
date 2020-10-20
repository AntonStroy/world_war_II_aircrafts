# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Columns: Aircraft_Type,Subtype,Name,Year_Service,Origin_Country,Operator
require "csv"
require "faker"

Aircraft.delete_all
OriginCountry.delete_all

filename = Rails.root.join("db/aircrafts.csv")

puts "Loading aircrafts from the CSV file: #{filename}"

csv_data = File.read(filename)
aircrafts = CSV.parse(csv_data, headers: true, encoding: "utf-8")

aircrafts.each do |aircraft|
  origin_country = OriginCountry.find_or_create_by(name: aircraft["Origin_Country"])

  if origin_country&.valid?
    create_aircraft = origin_country.aircrafts.create(
      name:          aircraft["Name"],
      aircraft_type: aircraft["Aircraft_Type"],
      service_start: aircraft["Year_Service"],
      units_build:   Faker::Number.between(from: 1, to: 3500),
      unit_price:    Faker::Commerce.price(range: 8000..400000)
    )

    puts "Invald aircraft #{aircraft['Name']}" unless create_aircraft&.valid?
  else
    puts "Invalid origin country #{aircraft['Origin_Country']} for aircraft #{aircraft['Name']}."
  end
end

puts "Created #{OriginCountry.count} contries of origin"
puts "Created #{Aircraft.count} Aircrafts"
