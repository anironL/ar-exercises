class Store < ActiveRecord::Base
  has_many :employees
  # Stores must always have a name that is a minimum of 3 characters
  validates :name, length: { minimum: 3 }
  # Stores have an annual_revenue that is a number (integer) that must be 0 or more
  validates :annual_revenue, numericality: { only_integer: true } 
  
  # BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
  validate :mens_apparel, :womens_apparel
  def must_sell_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add "Need to sell something."
    end
  end
end


