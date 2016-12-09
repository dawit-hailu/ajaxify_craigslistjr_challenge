class Article < ApplicationRecord
  belongs_to :category

  validates :title, :body, presence: true,
                      length: { minimum: 5 }
end
