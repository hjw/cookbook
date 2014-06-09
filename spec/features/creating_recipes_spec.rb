require 'spec_helper'

feature 'Creating Recipes' do
  before do
    visit '/'
    click_link 'New Recipe'
  end

  scenario "can create a recipe" do
    fill_in 'Name', with: 'Mud Pies'
    fill_in 'Instructions', with: 'Mix mud with water. Put in pans. Bake until done.'
    fill_in 'Ingredients', with: 'Mud, water, salt, pepper, sugar, baking soda'
    click_button 'Create Recipe'

    expect(page).to have_content('Recipe has been created.')

    recipe = Recipe.where(name: "Mud Pies").first
    expect(page.current_url).to eql(recipe_url(recipe))

    title = "Mud Pies Recipe, VMC Cookbook"
    expect(page).to have_title(title), "expected page title: #{title}, but  title is: #{page.title}"
  end

  scenario "cannot create a recipe without a name" do
    click_button 'Create Recipe'

    expect(page).to have_content("Recipe has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
  
