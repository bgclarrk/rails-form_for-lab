class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params(:first_name, :last_name))
        @student.save

        redirect_to @student
    end

    def show
        @student = find_student(params[:id])
    end

    def edit
        @student = find_student(params[:id])
    end

    def update
        @student = find_student(params[:id])
        @student.update(student_params(:first_name, :last_name))

        redirect_to @student
    end

    private

    def student_params(*args)
        params.require(:student).permit(*args)
    end

    def find_student(id)
        student = Student.find(id)
    end

end