class HomeController < ApplicationController
  # before_filter :authenticate_user! 
  
  def index
    @questions = Question.where("user_id != ?", current_user.id)
  end

  def my_questions
    @questions = current_user.questions    
  end

  def new_question
    @question = Question.new
  end

  def submit_question
    question = current_user.questions.new(question_params)
    if question.save
      flash[:notice] = "Question created successfully!"
      redirect_to home_index_path
    else
      flash[:error] = question.errors.full_messages.join(', ')
      redirect_to new_question_home_index_path
    end
  end

  def question_answers
    @question = get_question
    @question_answers = @question.answers  
  end

  def new_answer
    @question = get_question
    @answer = Answer.new
  end

  def submit_answer
    answer = current_user.answers.new(answer_params)
    if answer.save
      flash[:notice] = "Answer submitted successfully!"
      redirect_to question_answers_home_path(answer_params[:question_id])
    else
      flash[:error] = answer.errors.full_messages.join(', ')
      redirect_to new_answer_home_path(answer_params[:question_id])
    end    
  end

  def follow_user
    user = User.find(params[:id])
    follow = current_user.follows.new(following_id: params[:id], following_type: 'User')
    follow.save
    flash[:notice] = "You have followed #{user.email} successfully."
    redirect_to home_index_path
  end

  def follow_topic
    user = User.find(params[:id])
    follow = current_user.follows.new(following_id: params[:id], following_type: 'Topic')
    follow.save
    flash[:notice] = "You have followed #{user.email}'s topic successfully."
    redirect_to home_index_path
  end

  def new_topic
    @topic = Topic.new
  end

  def submit_topic
    topic = current_user.topics.new(topic_params)
    if topic.save
      flash[:notice] = "Topic submitted successfully!"
      redirect_to home_index_path
    else
      flash[:error] = topic.errors.full_messages.join(', ')
      redirect_to new_topic_home_index_path
    end        
  end

  def topics
    @topics = Topic.where("user_id != ?", current_user.id)
  end

  def my_topics
    @topics = current_user.topics
  end  

  def user_followers_following
    @user_followers = current_user.followers
    @user_followings = current_user.followings
  end

  def topic_followers_following
    @topic_followers = current_user.topic_followers
    @topic_followings = current_user.topic_followings    
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end

  def get_question
    Question.find_by(id: params[:id])
  end

  def answer_params
    params.require(:answer).permit(:question_id, :description)
  end

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end
