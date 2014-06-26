class Movie < ActiveRecord::Base
	validates :title, :description, :year_released, presence: true
  validates :description, length: { minimum: 10 }
  validates :year_released, numericality: { 
  	only_integer: true,
  	greater_than: 0
  } 
end
