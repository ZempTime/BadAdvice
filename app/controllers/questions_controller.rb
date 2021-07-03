class QuestionsController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.auth[:name], password: Rails.application.credentials.auth[:password], except: [:new, :create]

  before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.unanswered.order(created_at: :asc)

    @answered_questions = Question.answered.order(created_at: :asc)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.ip = request.ip

    if @question.save
      flash[:notice] = "Your question has been saved. Thanks for asking."
      redirect_to new_question_path
    else
      render :new
    end
  end

  def answered
    @question.answered!
    redirect_back(fallback_location: root_path)
  end

  def unanswered
    @question.unanswered!
    redirect_back(fallback_location: root_path)
  end

  private

  def question_params
    params.require(:question).permit(:author, :note)
  end

  def question_update_params
    params.require(:question).permit(:status)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end