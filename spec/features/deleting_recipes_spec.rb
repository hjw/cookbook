require 'spec_helper'

feature "Deleting recipes" do
  scenario "Deleting a recipe" do
    FactoryGirl.create(:recipe, name: "bad cookies")

    visit '/'
    click_link "bad cookies"
    click_link "Delete Recipe"

    expect(page).to have_content("Recipe has been deleted")

    visit '/'
    expect(page).to have_no_content("bad cookies")
  end
end

