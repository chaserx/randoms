require "./randoms/*"
require "kemal"
require "json"
require "uuid"

get "/" do |env|
  env.redirect "/index.html"
end

# GET /ping
get "/ping" do
  "pong"
end

# GET /version
get "/version" do |env|
  env.response.content_type = "application/json"

  {data: {version: "#{Randoms::VERSION}"}, responded_at: Time.utc}.to_json
end

# GET /hex?length=3 #=> return is 2x the length, default 16
get "/hex" do |env|
  env.response.content_type = "application/json"

  req_length = env.params.query["length"]?
  if req_length
    if match_group = req_length.match(/(\d+)/)
      length = match_group[0].to_i
    else
      length = 16
    end
  else
    length = 16
  end

  {method: "hex", data: {random: "#{Random.new.hex(length)}"}, responded_at: Time.utc}.to_json
end

# GET /number?length=10
get "/number" do |env|
  env.response.content_type = "application/json"

  req_length = env.params.query["length"]?
  if req_length
    if match_group = req_length.match(/(\d+)/)
      length = match_group[0].to_i
      data = Random::Secure.rand(length)
    else
      data = Random::Secure.rand
    end
  else
    data = Random.rand
  end

  {method: "number", data: {random: "#{data}"}, responded_at: Time.utc}.to_json
end

# GET "/base64"
get "/base64" do |env|
  env.response.content_type = "application/json"

  {method: "base64", data: {random: "#{Random.new.base64}"}, responded_at: Time.utc}.to_json
end

# GET "/uuid"
get "/uuid" do |env|
  env.response.content_type = "application/json"

  {method: "uuid", data: {random: "#{UUID.random.to_s}"}, responded_at: Time.utc}.to_json
end

Kemal.run
