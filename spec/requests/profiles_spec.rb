require 'spec_helper'

describe "Profiles" do
  describe "GET /profiles/:id" do
    it "returns the correct profile" do
      profile1 = create(:profile)
      get "/profiles/#{profile1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body["id"]).to eq(profile1.id)
      expect(body["description"]).to eq(profile1.description)
      expect(body["display_name"]).to eq(profile1.display_name)
      expect(body["email"]).to eq(profile1.email)
    end

    it "returns 404 if profile not found" do
      create(:profile)
      get "/profiles/invalididhere", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(404)
    end
  end

  describe "GET /profiles" do
    it "returns a list of profiles" do
      5.times { create(:profile) }
      get "/profiles/", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body.length).to eq(5)
      expect(body.map { |p| p['id'] }).to match_array(Profile.all.pluck(:id))
    end
  end
end

