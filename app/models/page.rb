class Page < ActiveRecord::Base
  has_many :notes, ->{ order :priority }

  validates :title, presence: true, uniqueness: true
end
