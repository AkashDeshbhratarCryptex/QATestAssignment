Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root  :to => redirect("/users/sign_in")
  resources :home do
    collection do
      get 'new_question'
      post 'submit_question'
      post 'submit_answer'
      get 'new_topic'
      post 'submit_topic'
      get 'topics'
      get 'my_questions'
      get 'my_topics'
      get 'user_followers_following'
      get 'topic_followers_following'
    end

    member do
      get 'question_answers'
      get 'new_answer'
      get 'follow_topic'
      get 'follow_user'      
    end
  end

end
