class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  def index
    @friendships = Friendship.all
    @users = User.all
  end

  # GET /friendships/1
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      redirect_to @friendship, notice: 'Friendship was successfully created.'
    else
      render :new
    end
  end

  # POST /users/:id/friendships
  def send_request
    @receiver = User.find(params[:id])
    Friendship.send_friend_request(current_user, @receiver)
    redirect_to '/users'
  end

  # PATCH /users/:id/friendships
  def accept_request
    @sender = User.find(params[:id])
    Friendship.accept_friend_request(current_user, @sender)
    redirect_to '/friendships'
  end

  # DELETE /users/:id/friendships
  def delete_request
    @sender = User.find(params[:id])
    Friendship.reject_friend_request(current_user, @sender)
    redirect_to '/friendships'
  end

  # PATCH/PUT /friendships/1
  def update
    if @friendship.update(friendship_params)
      redirect_to @friendship, notice: 'Friendship was successfully updated.'
    else
      render :edit
    end
  end

  # post users/:current_user.id/friendships/:user.id
  def send_greeting
    @receiver = User.find(params[:id])
    UserMailer.send_greeting_mail(current_user, @receiver).deliver
    redirect_to '/users'
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy
    redirect_to friendships_url, notice: 'Friendship was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def friendship_params
    params.require(:friendship).permit(:sender_id, :receiver_id, :is_friend)
  end
end
