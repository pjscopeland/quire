class Note < ActiveRecord::Base
  belongs_to :page, touch: true

  validates :page_id, presence: true

  def move_up
    other = page.notes.where(priority: priority - 1).first
    swap_priorities_with(other)
  end

  def move_down
    other = page.notes.where(priority: priority + 1).first
    swap_priorities_with(other)
  end

  private

  def swap_priorities_with(other)
    mine, theirs = [self, other].map { |n| n.try(:priority) }
    return unless [mine, theirs].all?
    transaction do
      other.update priority: mine
      update priority: theirs
    end
  end
end
