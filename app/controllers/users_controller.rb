class UsersController < ApplicationController
    #POST request for user signup create action
    def create
        user = User.create(user_params)
        if user.valid?
                render json: { user: UserSerializer.new(user) }, status: :created
        else
                render json: { error: 'Failed to create user'}, status: :unprocessable_entity
        end
    end
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end
