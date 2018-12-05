class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_women_or_men

  before_destroy :checkIfEmpty


  private

  def must_carry_women_or_men
    if mens_apparel == false && womens_apparel == false
      errors.add(:base, 'Must carry gendered apparel.')
    end
  end

  def checkIfEmpty
    if employees.size >= 1
      errors.add(:base, 'This store has employees in it.')
      throw :abort
    end
  end
end
