class Review < ActiveRecord::Base
	validates :title, presence: true
	validates :show, presence: true
	validates :author, presence: true
	validates :date_published, presence: true
	validates :recommend, presence: true
	validates :copy, presence: true
	validates :rating, presence: true
	validates :content, presence: true
end
