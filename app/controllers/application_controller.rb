class ApplicationController < ActionController::Base
# 全てのコントローラーを実行する前にauthenticate_user!を読み込む
  before_action :authenticate_user!
end
