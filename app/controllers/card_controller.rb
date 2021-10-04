class CardController < ApplicationController
  before_action :authenticate_user!
  # show・edit・updateアクションを呼ぶ前にset_cardメソッドを読み込む
  before_action :set_card, only: %i(show edit update destroy)
  before_action :set_list, only: %i(new create)

  def show
  
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update(card_params)
      flash[:notice] = "カードを更新しました。"
      redirect_to :root
    else
      render action: :edit
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:notice] = "カードを作成しました。"
      redirect_to :root
    else
      render action: :new
    end
  end

  def destroy
    @card.destroy
    flash[:alert] = "カードを削除しました。"
    redirect_to :root
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id, :deadline)
    end

    def set_card
      @card = Card.find_by(id: params[:id])
    end

    def set_list
      @list = List.find_by(id: params[:list_id])
    end
end
