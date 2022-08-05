class FindUser
  include Interactor

  def call
    context.user = find_user
  end

  private

  def find_user
    User.find_by!(email: context.params[:user])
  end
end
