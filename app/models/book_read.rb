class BookRead < ApplicationRecord
  belongs_to :user
  belongs_to :book

  acts_as_taggable

end
