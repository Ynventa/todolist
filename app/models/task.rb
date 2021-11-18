class Task < ApplicationRecord
  has_many :to_dos, inverse_of: :task
  accepts_nested_attributes_for :to_dos, allow_destroy: true, reject_if: Proc.new { |attrs| attrs["title"].blank? }

  validates :name, presence: true
  validates :name, length: { maximum: 200 }
end
