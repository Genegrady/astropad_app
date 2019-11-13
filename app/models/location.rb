class Location < ApplicationRecord
  require 'restcountry'
  has_many :padders
end
