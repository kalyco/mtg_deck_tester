class UsersController < ApplicationController
	before_action :set_user, only: [:show]

	def show

	end

	def new
		@user = User.new
	end

	def create
		binding.pry
	end

	private
	  def set_user
	  	@user = User.find(params[:id])
	  end

		def user_params
			params.require(:user).permit(:id, :email, :encrypted_password)
		end
end
