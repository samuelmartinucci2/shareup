class User::UsersController < Devise::SessionsController
  respond_to :json
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  def is_user
    reject_if_not_authorized_request!
    render status: 200,
           json: {
               success: !User.find_by_name(params[:name]).blank?
           }
  end

  private
  def reject_if_not_authorized_request!
    warden.authenticate!(
        scope: resource_name,
        recall: "#{controller_path}#failure")
  end
end