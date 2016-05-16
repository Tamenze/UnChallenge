class TasksController < ApplicationController
#add todo item
#mark them as done ( right now they default to not done, i need to:
# 				make them display done vs not done (instead of true/false)


#delete todo item
# =>  			make the checkbox render next to each one in the list (so allow update from index view)

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		if @task.save 
			flash[:notice] = "Task successfully added!"
			redirect_to tasks_path
		else
			flash[:alert] = "Problem saving task"
			redirect_to new_task_path
		end
	end

	def show
		@task = Task.find(params[:id])
	end


	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			flash[:notice] = "Task successfully updated!"
			redirect_to tasks_path
		else
			flash[:alert] = "Problem saving task"
			redirect_to edit_task_path
		end
	end

	def destroy
	end




	private
	def task_params
		params.require(:task).permit(:body, :status)
	end
	
end
