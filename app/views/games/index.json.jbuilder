json.array!(@games) do |game|
  json.extract! game, :references
  json.url game_url(game, format: :json)
end