class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		#@user = User.new(name: params[:name], email: params[:email], password: params[:password])

		@user = User.new(user_params)

		if @user.save
			redirect_to new_user_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.save
			flash[:success] = "User succesfully saved."
			redirect_to new_user_path
		else
			flash[:danger] = "Please enter valid information."
			render :edit
		end
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
