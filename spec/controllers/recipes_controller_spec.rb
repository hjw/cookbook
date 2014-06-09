require 'spec_helper'

describe RecipesController do
  it "displays an error for a missing project" do
    get :show, id: "not-here"
    expect(response).to redirect_to(recipes_path)
    message = "The recipe you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end
