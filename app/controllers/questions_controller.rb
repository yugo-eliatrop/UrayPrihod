class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show new create]
  before_action :check_rights, except: %i[index show new create]
  before_action :set_question, only: %i[edit update show destroy]

  def index
    @questions = Question.answered
    @unanswered = Question.unanswered
  end

  def unanswered
    @unanswered = Question.unanswered
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params.merge(answerer_id: current_user.id))
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_path
    else
      redirect_to @question
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:name, :email, :question_text,
                                     :answer_text)
  end
end
