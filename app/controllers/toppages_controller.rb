class ToppagesController < ApplicationController
  def index
    @jobs = Job.all
  end
end
