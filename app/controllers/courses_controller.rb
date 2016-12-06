class CoursesController < ApplicationController
before_filter :authenticate_teacher!
  
  def index
    @message="All Created Courses Should List Here"
     @courses = Course.all
  end
  
  def show
    @course = Course.new
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(params[:name])
    if @course.save
      flash[:notice] = "Successfully created a course."
      redirect_to @course
    else
      render :action => 'new'
    end
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:notice] = "Successfully updated course."
      redirect_to @course
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Successfully removed the course."
    redirect_to courses_url
  end
end

