class CoursesController < ApplicationController

	def index
		@courses = Course.all
		if params[:name].present?
			@courses=@courses.where("name like?","%#{params[:name]}%",)
		end
		if params[:teacher].present?
			@courses=@courses.where("teacher like?","%#{params[:teacher]}%",)
		end
		if params[:time].present?
			@courses=@courses.where("time like?","%#{params[:time]}%",)
		end
	end
	def new
		@course = Course.new
	end
def edit
	@course = Course.find(params[:id])
end

	def create
  @course = Course.new(course_params)
 
  @course.save
  redirect_to @course
end

def update
	@course = Course.find(params[:id])
	if @course.update(course_params)
		redirect_to @course
	else
		render 'edit'
	end
	
end

def show
 @course=Course.find(params[:id])
end

def destroy
	@course= Course.find(params[:id])
	@course.destroy

	redirect_to root_path
	
end
	
end

private
def  course_params
	params.require(:course).permit(:name, :teacher,:time,:place,:credit)
end


