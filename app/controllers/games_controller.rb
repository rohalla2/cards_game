class GamesController < ApplicationController
  before_action :authorize
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @cards = @auth_player.cards.where('game_id = "?"', @game.id)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  def addplayer
    name = params[:name]
    code = params[:code]
    game = Game.find_by(name: name)
    if !game.nil? and game.code = code
      g = GamesPlayers.new
      g.player_id = @auth_player.id
      g.game_id = game.id
      g.save
      redirect_to game_path(game), notice: "Welcome to the Game!"
    else
      redirect_to "/games/join", notice: "Could not find that game."
    end
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.creator_id = @auth_player.id
    @game.game_status = "not_started"
    respond_to do |format|
      if @game.save
        g = GamesPlayers.new
        g.player_id = @auth_player.id
        g.game_id = @game.id
        g.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    cards = CardsPlayer.where("game_id = ?", @game.id)
    cards.destroy_all
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
    end
  end

  def start
    if @game.game_status == "started"
      redirect_to game_path(@game)
    end

    
    @game.players.each do |player| 
      cards = @game.cards.limit(10).where("cardtype = 'A'").order("RANDOM()")
      cards.each do |card|
        assign = CardsPlayer.new  
        assign.game_id = @game.id
        assign.player_id = player.id
        assign.card_id = card.id
        assign.save
        refcard = AvailableCard.where("game_id = ? and card_id = ?", @game.id, card.id).first
        refcard.destroy
      end
    end
    
    @game.update(game_status: "started")

    redirect_to game_path(@game) 
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :code, :closed)
    end
end
