require 'spec_helper'

feature 'Creating Recipes' do
  scenario "can create a recipe" do
    visit '/'
    click_link 'New Recipe'

    fill_in 'Name', with: 'Mud Pies'
    fill_in 'Instructions', with: 'Mix mud with water. Put in pans. Bake until done.'
    fill_in 'Ingredients', with: 'Mud, water, salt, pepper, sugar, baking soda'
    click_button 'Create Recipe'

    expect(page).to have_content('Recipe has been created.')
  end
end
  
