class FillTexts < ActiveRecord::Migration[5.2]
  def change
    Text.new(title: 'About', content: 'Empty').save
    Text.new(title: 'Holiday', content: 'Empty').save
    Text.new(title: 'History', content: 'Empty').save
    Text.new(title: 'Priests', content: 'Empty').save
    Text.new(title: 'Schedule', content: 'Empty').save
  end
end
