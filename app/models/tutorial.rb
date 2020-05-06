class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }, inverse_of: :tutorial,
                                                  dependent: :destroy
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos
end
