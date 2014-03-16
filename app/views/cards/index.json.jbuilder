json.array!(@cards) do |card|
  json.extract! card, :id, :type, :text, :num_answers, :expansion
  json.url card_url(card, format: :json)
end
