class WelcomeController < ApplicationController
  PER = 10 
  
  def index
    @q = Contribute.page(params[:page]).per(PER).order(entry_time: :desc)
          .search(search_params)
    @contributes = @q.result(distinct: true)

    #@contributes = Contribute.page(params[:page]).per(PER).
               #where('user_id = ?', session[:user_id]).order(entry_time: :desc)
  end

  private

  def search_params
    params.require(:q).permit(:title_or_content_cont, 
                              :entry_time_gteq, :entry_time_lteq ,
                              :user_id) 
  rescue
    {entry_time_lteq: Time.zone.now}
  end
end
