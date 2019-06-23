class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]


    def show
    end

    private

    def require_authorized_for_current_lesson 
      if current_lesson.user != current_user
        redirect_course, alert: 'You Must Enroll First!', status: :unauthorized
      end
    end

    helper_method :current_lesson
    def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
    end
end
