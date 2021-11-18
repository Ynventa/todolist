class ToDo < ApplicationRecord
  belongs_to :task, inverse_of: :to_dos
  
  validates :title, presence: true
  validates :title, length: { maximum: 200 }
end
