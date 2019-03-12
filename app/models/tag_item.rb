class TagItem < ApplicationRecord

    belongs_to :tag
    belongs_to :target, :polymorphic => true

end
