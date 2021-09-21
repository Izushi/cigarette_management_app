class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  NUMBER_OF_CIGARETTES_IN_A_BOX = 20
  PROLONGED_MINUTES_PER_ONE_CIGARETTE = 5

  def after_sign_in_path_for(resource)
    graphs_path
  end
end
