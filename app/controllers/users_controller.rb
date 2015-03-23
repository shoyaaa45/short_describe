class UsersController < ApplicationController
  before_action :authenticate

  def retire

  end

  def destroy
    #レコードは本当には削除しない。
    reset_session #セッションリセット
    redirect_to root_path, notice: "退会完了！"
  end
end
