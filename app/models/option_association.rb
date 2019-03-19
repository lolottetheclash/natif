class OptionAssociation < ApplicationRecord
  belongs_to :variant
  belongs_to :option_value

  validates :variant,
    presence: true
  validates :option_value,
    presence: true
end
