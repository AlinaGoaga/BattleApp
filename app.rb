require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_player))
    erb :attack
  end

  get '/gameover' do
    @game = $game
    erb :game_over
  end

  post '/switch' do
    @game = $game
    return redirect('/gameover') if @game.over?
    @game.switch
    redirect('/play')
  end

  run! if app_file == $PROGRAM_NAME
end
