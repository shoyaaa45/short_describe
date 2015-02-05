class Contribute < ActiveRecord::Base
  #belongs_to :owner, class_name: 'User'
  belongs_to :user

  validates :title, length: {maximum: 50 }, presence: true
  validates :entry_time, presence: true
  validates :content, length: {maximum: 2000 }, presence: true

  def created_by?(param_user)
    return false unless user
    user_id == param_user.id
    #binding.pry
  end

  private

end