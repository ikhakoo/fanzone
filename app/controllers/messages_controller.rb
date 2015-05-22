class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html do
          redirect_to messages_path, notice: 'Message created successfully' 
        end
        format.js
      else
        format.html { render 'messages', alert: 'There was an error' }
      end
    end
  end

 private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
