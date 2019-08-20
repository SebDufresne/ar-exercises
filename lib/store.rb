class Store < ActiveRecord::Base
  has_many :employees
  validates :annual_revenue, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :annual_revenue, presence: true, length: { minimum: 3 }
  validate :mens_or_womens_apparel

  def mens_or_womens_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:name, "must carry men's or women's apparel")
    end
  end
end
