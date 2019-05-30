class PostImagesController < ApplicationController
	def index
		@book = Book.new
		@books = Book.all
	end
end
