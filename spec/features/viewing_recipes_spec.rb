require 'spec_helper'

feature "Viewing recipes" do
  scenario "Listing all recipes" do
    recipe = FactoryGirl.create(:recipe, name: "Mud Pies")

    visit '/'
    click_link 'Mud Pies'
    expect(page.current_url).to eql(recipe_url(recipe))
  end
end
