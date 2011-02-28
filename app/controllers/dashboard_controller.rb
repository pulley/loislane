class DashboardController < ApplicationController
  # GET /
  def start
    @commits = Commit.reviewable.page(params[:page])
  end

  # GET /help
  def help
  end
end
