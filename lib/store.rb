class Store < ActiveRecord::Base
  has_many :employees

  validates :annual_revenue, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { minimum: 3 }
  validate :mens_or_womens_apparel

  before_destroy :check_for_employees, prepend: true
  
  private

  def mens_or_womens_apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:name, "must carry men's or women's apparel")
    end
  end

  def check_for_employees
    if employees.any?
      errors[:base] << "Can't be destroy because of something"
      throw :abort
    end
  end

end
