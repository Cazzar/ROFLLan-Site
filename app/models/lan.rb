class Lan < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 5} 
	validates :end_date, presence: true
	validates :start_date, presence: true
	validates :max_players, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :description, presence: true
end
