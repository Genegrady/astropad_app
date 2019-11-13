# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'restcountry'
# byebug
# countries = Restcountry::Country.all

# 50.times do
# byebug
# Location.create(city: Restcountry::Country.all.sample.capital, country: Restcountry::Country.all.sample.name)
# end
@countries = Restcountry::Country.all

50.times do
@country = @countries.sample
    Location.create(city: @country.capital, country: @country.name, languages: @country.languages.find{|h| h['name']})
end