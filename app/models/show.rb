class Show < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :number_of_seasons, presence: true
	validates :status, presence: true

end
