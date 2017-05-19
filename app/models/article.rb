class Article < ApplicationRecord

	#rails generate scaffold Comment user:references article:references body:text


	belongs_to :user
	has_many :comments
	before_create :set_visit_count
	validates :title, presence:true, uniqueness:true
	validates :body, presence:true, length: { minimum: 5 } 

	def update_visits_count
		self.update(visits_count: self.visits_count+1)
	end


	private

	def set_visit_count

		self.visits_count =0
	end


end
