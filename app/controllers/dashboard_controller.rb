class DashboardController < ApplicationController
  # GET /
  def start
    @commits = Commit.reviewable
  end

  # GET /help
  def help
  end
end
