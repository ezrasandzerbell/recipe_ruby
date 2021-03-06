require('spec_helper')

describe(Recipe) do
  describe('tests for recipe properties') do
    it('tests for name of recipe') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      expect(recipe.title).to(eq("Filet Mignon"))
    end
    it('tests for cook time of recipe') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      expect(recipe.cook_time).to(eq(45))
    end
  end
  describe('tests for integration with other tables') do
    it('tests for integration with ingredients step') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      measurement_test = Measurement.create({:recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(recipe.ingredients).to(eq([ingredient]))
    end
  end
end
