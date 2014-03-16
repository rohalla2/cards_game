json.array!(@players) do |player|
  json.extract! player, :name, :password, :password_confirmation
  json.url player_url(player, format: :json)
end