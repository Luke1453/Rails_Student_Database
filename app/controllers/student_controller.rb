# frozen_string_literal: true

# Class that controls Student model
class StudentController < ApplicationController
  def list
    @students = if params[:search].blank?
                  Student.all
                else
                  Student.where('lower(first_name) like ?', params[:search].downcase.to_s)
                end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.valid?
      @student.save
      redirect_to '/', notice: 'Student saved!'
    else
      flash.now[:notice] = @student.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.valid?
      @student.update(student_param)
      redirect_to action: 'show', id: @student, notice: 'Student saved!'
    else
      flash.now[:notice] = @student.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to '/', notice: 'Student deleted!'
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
                  :study_type,
                  :b_year,
                  :b_month,
                  :b_day)
  end

  def student_params
    params.require(:student)
          .permit(:first_name,
                  :last_name,
                  :p_id,
                  :gender,
                  :address,
                  :phone_nr,
                  :study_program,
                  :study_type,
                  :b_year,
                  :b_month,
                  :b_day)
  end
end
