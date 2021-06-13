class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(school_class_params(:title, :room_number))
        @school_class.save

        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = find_school_class(params[:id])
    end

    def edit
        @school_class = find_school_class(params[:id])
        @school_class.title = params[:title]
        @school_class.room_number = params[:room_number]
        @school_class.save
    end

    def update
        @school_class = find_school_class(params[:id])
        @school_class.update(school_class_params(:title, :room_number))

        redirect_to school_class_path(@school_class)
    end

    private

    def school_class_params(*args)
        params.require(:school_class).permit(*args)
    end

    def find_school_class(id)
        school = SchoolClass.find(id)
    end

end