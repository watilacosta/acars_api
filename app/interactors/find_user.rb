class FindUser
  include Interactor

  def call
    context.user = find_user
  end

  private

  def find_user
    User.find(context.params[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e.message)
  end
end
