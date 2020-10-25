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

AircraftSubtype.delete_all
Subtype.delete_all
Aircraft.delete_all
OriginCountry.delete_all
Page.delete_all

Page.create(title:     "About the Data",
            content:   "The web site contains all aircrafts that were produced in the period of world war II",
            permalink: "about_the_data")

Page.create(title:     "Contact Us",
            content:   "If you find that this list is missing information about world war II aircrafts please contact at jimhawkins@aircrafts.com",
            permalink: "contact_us")

filename = Rails.root.join("db/aircrafts.csv")

puts "Loading aircrafts from the CSV file: #{filename}"

csv_data = File.read(filename)
aircrafts = CSV.parse(csv_data, headers: true, encoding: "utf-8")

aircrafts.each do |a|
  origin_country = OriginCountry.find_or_create_by(name: a["Origin_Country"])

  if origin_country&.valid?
    aircraft = origin_country.aircrafts.create(
      name:          a["Name"],
      aircraft_type: a["Aircraft_Type"],
      service_start: a["Year_Service"],
      units_build:   Faker::Number.between(from: 1, to: 3500),
      unit_price:    Faker::Commerce.price(range: 8000..400_000)
    )

    unless aircraft&.valid?
      puts "Invalid aircraft #{a['Name']}"
      next
    end

    subtypes = a["Subtype"].split(",").map(&:strip)
    subtypes.each do |s|
      subtype = Subtype.find_or_create_by(name: s)
      AircraftSubtype.create(aircraft: aircraft, subtype: subtype)
    end

  else
    puts "Invalid origin country #{a['Origin_Country']} for aircraft #{a['Name']}."
  end
end

puts "Created #{OriginCountry.count} contries of origin"
puts "Created #{Aircraft.count} Aircrafts"
puts "Created #{Subtype.count} Subtypes"
puts "Created #{AircraftSubtype.count} Aircraft Subtypes"
