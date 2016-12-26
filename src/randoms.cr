require "./randoms/*"
require "kemal"
require "json"

get "/" do
  "Hello World!"
end

# GET /hex?length=3
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

  {method: "hex", data: {random: "#{SecureRandom.hex(length)}"}, responded_at: Time.utc_now}.to_json
end

get "/base64" do |env|
  env.response.content_type = "application/json"
  {method: "base64", data: {random: "#{SecureRandom.base64}"}, responded_at: Time.utc_now}.to_json
end

get "/uuid" do |env|
  env.response.content_type = "application/json"
  {method: "uuid", data: {random: "#{SecureRandom.uuid}"}, responded_at: Time.utc_now}.to_json
end

Kemal.run
