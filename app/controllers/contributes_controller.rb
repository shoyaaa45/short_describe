class ContributesController < ApplicationController
  before_action :authenticate

  def show
    @contribute = Contribute.find(params[:id])
  end 

  def new
    @contribute = current_user.created_contributes.build
  end

  def create
    @contribute = current_user.created_contributes.build(contribute_params)
    if @contribute.save
      redirect_to @contribute, notice:'作成完了！'
    else
      render :new
    end
  end

  def edit
    @contribute = current_user.created_contributes.find(params[:id])
  end

  def update
    @contribute = current_user.created_contributes.find(params[:id])
    if @contribute.update(contribute_params)
      redirect_to @contribute, notice: '更新完了！'
    else
      render :edit
    end
  end

  def destroy
    @contribute = current_user.created_contributes.find(params[:id])
    @contribute.destroy!
    redirect_to root_path, notice: '削除完了！'
  end

  private

  def contribute_params
    params.require(:contribute).permit(
      :title, :entry_time, :content
    )
  end

end
