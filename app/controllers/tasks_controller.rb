class TasksController < ApplicationController

	def index
		@tasks = Tasks.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(text_params)
	end

	def edit
	end

	def destroy
	end



	# def update
	# end

	# def text_params

	# end
	
end
