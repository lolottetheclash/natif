class OptionValue < ApplicationRecord
  belongs_to :option
  has_many :option_associations
end
