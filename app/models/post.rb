class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates :title, presence: true
    validates :content, length: { minimum: 100, too_short: "must have at least 100 characters"}
end
