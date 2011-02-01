class DashboardController < ApplicationController
  # GET /
  def start
    @commits = Commit.reviewable
  end
end
