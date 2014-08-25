class Note < ActiveRecord::Base
  belongs_to :page, touch: true
end
