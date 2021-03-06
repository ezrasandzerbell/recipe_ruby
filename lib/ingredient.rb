class Ingredient < ActiveRecord::Base
  has_many(:measurements)
  has_many(:recipes, through: :measurements)
  before_save(:upcased_name)
  validates(:name,:uniqueness => {:case_sensitive => false})

private

  def upcased_name
    self.name=(name().upcase())
  end
end
