class Page < ActiveRecord::Base
  has_many :notes

  validates :title, presence: true, uniqueness: true
end
