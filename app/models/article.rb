class Article < ActiveRecord::Base
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 140, :message => 'Title has a maximum length of 140 characters.' }
    validates :text, presence: true, allow_blank: false
end