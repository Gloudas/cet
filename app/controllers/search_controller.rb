class SearchController < ApplicationController

	before_filter :set_current_user
	
	def index
		if !params[:search].blank?
			@user_results = User.search(params[:search])
			@project_results = Project.search(params[:search])
		else
			@user_results = []
			@project_results = []
		end
	end


end