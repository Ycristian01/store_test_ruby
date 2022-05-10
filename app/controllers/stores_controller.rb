class StoresController < ApplicationController

  def index
    @users = User.all
  end
end