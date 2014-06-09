require 'spec_helper'

feature "Editing Recipes" do
  before do
    FactoryGirl.create(:recipe, name: "Mud Pies")
    visit "/"
    click_link "Mud Pies"
    click_link "Edit Recipe"
  end

  scenario "Updating a recipe" do
    fill_in "Name", with: "Better Mud Pies"
    click_button "Update Recipe"

    expect(page).to have_content("Recipe has been updated.")
  end

  scenario "Updating a recipe with invalid attripbutes is bad" do
    fill_in "Name", with: ""
    click_button "Update Recipe"

    expect(page).to have_content("Recipe has not been updated.")
  end
end
