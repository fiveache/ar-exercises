class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  before_create :assign_password, on: :create

  private

  def assign_password
    self.password = rand 10_000_000..99_999_999
  end
end
