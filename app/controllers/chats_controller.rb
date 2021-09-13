class ChatsController < ApplicationController
  get '/chats' do
    redirect_unless_logged_in

    @users = User.where.not(id: current_user.id)

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chats/:user_nick' do
    redirect_unless_logged_in

    @users = User.where.not(id: current_user.id)

    @receiver = @users.find_by(nick: params[:user_nick])

    return erb :'404.html', layout: :'layout.html' unless @receiver

    @messages = Message.where(mailer: [current_user, @receiver], receiver: [current_user, @receiver])
                       .includes(:mailer)
                       .order(created_at: :asc)

    erb :'chats/show.html', layout: :'layout.html'
  end

  post '/chat/destroy' do
    Message.last.destroy
    redirect '/chats'
  end
end
