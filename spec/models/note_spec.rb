require 'rails_helper'

RSpec.describe Note, :type => :model do
  before do
    page = Page.create(title: 'Whatever')
    @note1 = Note.create(content: '1', priority: 1, page: page)
    @note2 = Note.create(content: '2', priority: 2, page: page)
  end
    
  it '#move_up' do
    @note2.move_up

    expect(@note1.reload.priority).to eq(2)
    expect(@note2.reload.priority).to eq(1)
  end

  it '#move_up top note' do
    @note1.move_up

    expect(@note1.reload.priority).to eq(1)
    expect(@note2.reload.priority).to eq(2)
  end

  it '#move_down' do
    @note1.move_down

    expect(@note1.reload.priority).to eq(2)
    expect(@note2.reload.priority).to eq(1)
  end

  it '#move_down bottom note' do
    @note2.move_down

    expect(@note1.reload.priority).to eq(1)
    expect(@note2.reload.priority).to eq(2)
  end
end
