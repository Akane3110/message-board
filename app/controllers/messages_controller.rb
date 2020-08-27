class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end
    
    def show
        @message = Message.find(params[:id])
    end
    
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        
        if @message.save
            flash[:success] = 'メッセージが正常に投稿されました！'
            redirect_to @message
        else
            flash.now[:danger] = 'メッセージの投稿に失敗しました（T_T）'
            render :new
        end
    end
    
    def edit
        @message = Message.find(params[:id])
    end
    
    def update
        if @message.update
            flash[:success] = 'メッセージが正常に投稿されました！'
            redirect_to @message
        else
            flash.now[:danger] = 'メッセージの投稿に失敗しました（T_T）'
            render :edit
        end        
    end
    
    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        
        flash[:success]='メッセージは葬り去られました。'
        redirect_to messages_url
    end
    
    private
    
    # Strong Parameter
    def message_params
        params.require(:message).permit(:content)
    end
end
