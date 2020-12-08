class StudentController < ApplicationController
  def list
    @students = Student.all
    #render 'list'
  end

  def show
    @student = Student.find(params[:p_id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to action: 'list'
    else
      render action: 'new'
    end
  end

  def edit
    @student = Student.find(params[:p_id])
  end

  def update
    @student = Student.find(params[:p_id])

    if @student.update_attributes(student_params)
      redirect_to action: 'show', p_id: @book
    else
      render action: 'edit'
    end
  end

  def delete
    Student.find(params[:p_id]).destroy
    redirect_to action: 'list'
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
