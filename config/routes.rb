Rails.application.routes.draw do
  devise_for :users, :controller => {
    :sessions => 'sessions'
  }
  root 'top#index'

    resources :users, only: %i(show edit update) do
      collection do #id付与はしない
      get 'quit' #退会画面
      patch 'out' #is_deletedを更新する
    end
  end

  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
  
end
