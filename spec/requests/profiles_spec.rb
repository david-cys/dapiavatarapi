require 'spec_helper'

describe "Profiles" do
  describe "POST /profiles" do
    it "creates a profile" do
      profile_count = Profile.count
      post "/profiles",
        { "display_name" => "create name",
          "description" => "create description",
          "email" => "create@example.com" },
        {"Accept" => "application/json" }

      expect(response.status).to eq(200)
      expect(Profile.count).to eq(profile_count + 1)
      body = JSON.parse(response.body)["data"]
      puts body
      expect(body["description"]).to eq("create description")
      expect(body["display_name"]).to eq("create name")
      expect(body["email"]).to eq("create@example.com")
    end

    it "returns 400 error if not saved" do
      profile_count = Profile.count
      post "/profiles",
        { "display_name" => "create name",
          "description" => "create description"},
        {"Accept" => "application/json" }
      expect(response.status).to eq(400)
      expect(Profile.count).to eq(profile_count)
    end
  end

  describe "POST /profiles/:id" do
    it "updates profile" do
      pending
    end
  end

  describe "DELETE /profiles/:id" do
    it "deletes profile" do
      pending
    end
  end

  describe "GET /profiles/:id" do
    it "returns the correct profile" do
      profile1 = create(:profile)
      get "/profiles/#{profile1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq(200)
      body = JSON.parse(response.body)["data"]
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
      body = JSON.parse(response.body)["data"]
      expect(body.length).to eq(5)
      expect(body.map { |p| p['id'] }).to match_array(Profile.all.pluck(:id))
    end
  end

  describe "GET profiles with query arguments" do
    it "allows searching and filtering of profiles" do
      5.times { create(:profile) }
      get "/profiles", { :query => Profile.last.display_name },
        { "Accept" => "application/json" }

      expect(response.status).to eq(200)
      body = JSON.parse(response.body)["data"]
      expect(body.length).to eq(1)
      expect(body.map { |p| p['display_name'] }).
        to match_array([Profile.last.display_name])
    end
  end
end

