class CreateFsacarsConnection
  include Interactor

  def call
    FsacarsConnection.create!(sanitize_params)
  rescue ActiveRecord::RecordInvalid => e
    puts e.message
    context.fail!(message: e.message)
  end

  private

  def sanitize_params
    params = context.params[:user_query]

    {
      user_id: context.params[:user_id],
      pass:    params[:pass],
      auth:    params[:auth],
      version: params[:ver],
      lat:     params[:lat],
      lon:     params[:lon],
      eqpt:    params[:eqpt]
    }
  end
end
