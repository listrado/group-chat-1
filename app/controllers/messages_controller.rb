class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.group_id = params[:group_id]
    @message.user = current_user
    @group = @message.group

    if @message.save
      redirect_to user_group_path(current_user, params[:group_id])
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
