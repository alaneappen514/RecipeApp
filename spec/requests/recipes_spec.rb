require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let!(:recipes) {FactoryBot.create(:random_recipe)}

  describe "GET #index" do
    before do
      get ('/api/v1/recipes')
    end
    it "should get index" do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["data"][0]["attributes"]["title"]).to eq ("chicken and rice")
    end
  end

  describe "GET #show" do
   before do
    get ('/api/v1/recipes/1')
   end
   it "should get a recipe" do
     expect(response).to have_http_status(200)
     expect(JSON.parse(response.body)["data"]["attributes"]["title"]).to eq ("chicken and rice")
  end
 end

  describe "POST #create" do
  it "should post a sandwhich recipe" do
    post('/api/v1/recipes/', params: {title:"Chicken Soup", ingredients:"chicken, chicken broth", description:"boil water and chicken broth", user_id: recipes.user.id})
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)["data"]["attributes"]["title"]).to eq ("Chicken Soup")
  end

  it "should fail test if title is blank" do
    post('/api/v1/recipes/', params: {title:"", ingredients:"chicken, chicken broth", description:"boil water and chicken broth", user_id: recipes.user.id})
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["error"]).to match (/Validation failed/)
 end
end

  describe "PUT #update" do 
  it "should update a recipe" do 
      @new_description = "Boil water and add rice. Marinate chicken and cook the chicken in pot"
      put('/api/v1/recipes/1', params: {description: @new_description})
      expect(response).to have_http_status(200)
      expect(Recipe.find(recipes.id).description).to eq (@new_description)
  end
 end
end
