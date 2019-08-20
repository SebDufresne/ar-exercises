class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, presence: true, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store_id, presence: true, allow_nil: false, allow_blank: false

  before_create do
    self.password = generate_code(8) if password.blank?
  end

  # after_create do
  #   Employee.find(id).update(password: generate_code(8))
  # end

  private
    def generate_code(number)
      charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
      Array.new(number) { charset.sample }.join
    end
end