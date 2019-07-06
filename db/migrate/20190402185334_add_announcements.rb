class AddAnnouncements < ActiveRecord::Migration[5.2]
  def change
    Text.new(title: 'Announcement', content: 'Empty').save
  end
end
