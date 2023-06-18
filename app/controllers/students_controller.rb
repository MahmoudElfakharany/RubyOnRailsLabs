class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index, :show]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'successfully destroyed.'
  end

  private

  def set_student
    @student = Student.find(params[:id])
    unless @student
      redirect_to students_url, alert: 'Student not found.'
    end
  end

  def student_params
    params.require(:student).permit(:name, :age, :track_id)
  end

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "You don't have permission to perform this action."
    end
  end
end