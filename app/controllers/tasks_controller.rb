class TasksController < ApplicationController
#add todo item
#mark them as done ( right now they default to not done, i need to:
# 				make them display done vs not done (instead of true/false)
# delete todo item
# add in create form to index page (render?)
#make actions ajax (so create, update, and delete)
# => make the checkbox render next to each one in the list (so allow update from index view)
#clear text field after creating task
#styling
	def index
		@tasks = Task.all
		@task = Task.new
		# render 'new'
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		respond_to do |format|
			if @task.save 
				# format.html {redirect_to @task, notice: "Task successfully added!"}
				# format.json{ render json: @task, status: :created, location: @task}
				format.js
			else
				format.html { render action: "new"}
				format.json{ render json: @task.errors, status: unprocessable_entity}
				format.js
			end
		end
	end

	# def show
	# 	@task = Task.find(params[:id])
	# end


	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		
		respond_to do |format|
			if @task.update(task_params)
				# flash[:notice] = "Task status successfully updated!"
				# redirect_to tasks_path
				# fornat.html{}
				format.js
			else
				# flash[:alert] = "Problem updating task status."
				# redirect_to edit_task_path
				format.js
			end
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		respond_to do |format|
			if @task.destroy
				format.html {redirect_to tasks_path, notice: "Deleted Task successfully."}
				format.js
			else
			format.html{ redirect_to tasks_path notice: "NOT DELETED." }
			end
		end
	end




	private
	def task_params
		params.require(:task).permit(:body, :status)
	end
	
end
