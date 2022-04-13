class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

    # adding our validations on one line when the presence is true is optional
  validates :name, :scientist, :planet, presence: true
  #scientist cannont join the same mission twice 
  validates :scientist, uniqueness: {scope: :name}
end
