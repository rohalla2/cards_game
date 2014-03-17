class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
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
      g.player_id = @player.id
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
    @game.creator_id = @player.id
    respond_to do |format|
      if @game.save
        g = GamesPlayers.new
        g.player_id = @player.id
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
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def start
    #loop through each player and assign them 10 random A cards
    @game.players.each do |player|
      10.times do
        card = Card.where("cardType = 'A'").all(order: "RANDOM()", limit: 1)
        assign = CardsPlayer.new
        assign.game_id = @game.id
        assign.player_id = player.id
        assign.card_id = card[0].id
        assign.save
        refcard = AvailableCard.where("game_id = ? and card_id = ?", @game.id, card[0].id).first
        refcard.destroy
      end
    end

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
