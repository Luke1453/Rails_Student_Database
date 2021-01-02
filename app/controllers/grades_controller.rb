class GradesController < ApplicationController
  def new
    @student = Student.find(params[:id])
    @grade = Grade.new
    @grade.student_id = @student.id
  end

  def create
    @grade = Grade.new(grade_params)
    @student = Student.find(grade_params[:student_id])

    if @grade.valid?
      @grade.save
      redirect_to student_show_path(id: grade_params[:student_id]), notice: 'Grade saved!'
    else
      flash.now[:notice] = @grade.errors.full_messages
      render action: 'new'
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    redirect_to student_show_path(id: @grade.student_id), notice: 'Grade deleted!'
    @grade.destroy
  end

  def grade_params
    params.require(:grade)
          .permit(:grade_name,
                  :grade_year_t,
                  :grade_month_t,
                  :grade_day_t,
                  :grade_value,
                  :student_id)
  end
end
