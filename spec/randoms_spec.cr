require "./spec_helper"

describe Randoms do
  describe "GET /ping" do
    it "renders pong" do
      get "/ping"
      response.body.should eq "pong"
    end
  end

  describe "GET /version" do
    it "renders the version" do
      get "/version"
      JSON.parse(response.body)["data"]["version"].should eq(Randoms::VERSION)
    end
  end

  describe "GET /hex" do
    it "renders some HEX string" do
      get "/hex"
      JSON.parse(response.body)["data"]["random"].to_s.should match(/[0-9a-fA-F]+/)
    end
  end

  describe "GET /uuid" do
    it "renders some UUID string" do
      get "/uuid"
      JSON.parse(response.body)["data"]["random"].to_s.should match(/([\w]{8}(-[\w]{4}){3}-[\w]{12})/)
    end
  end

  describe "GET /base64" do
    it "renders some base64 string" do
      get "/base64"
      JSON.parse(response.body)["data"]["random"].to_s.should match(/^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$/)
    end
  end
end
