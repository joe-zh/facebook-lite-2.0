class StatusesController < ApplicationController
  # Since only a logged in user should be able to post statuses for himself,
  # use the current_user as the user the status belongs to.
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(text: params[:status][:text], user_id: current_user.id)
    @user = current_user
    if @status.save
      current_user.statuses << @status
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.text = params[:status][:text]
    if @status.save
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to current_user
  end
end
