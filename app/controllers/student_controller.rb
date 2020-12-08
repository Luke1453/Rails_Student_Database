class StudentController < ApplicationController
  def list
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @print = @student.last_name
    if @student.save
      redirect_to action: 'list'
    else
      render action: 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(student_param)
      redirect_to action: 'show', id: @student
    else
      render action: 'edit'
    end
  end

  def delete
    Student.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  def student_param
    params.require(:student)
          .permit(:first_name,
                  :last_name,
                  :p_id,
                  :gender,
                  :address,
                  :phone_nr,
                  :study_program,
                  :study_type)
  end

  def student_params
    params.require(:students)
          .permit(:first_name,
                  :last_name,
                  :p_id,
                  :gender,
                  :address,
                  :phone_nr,
                  :study_program,
                  :study_type)
  end
end
