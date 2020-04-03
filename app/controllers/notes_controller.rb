class NotesController < ApplicationController
  def index; end

  def success_page; end

  def send_notes
    notes = note_params
    keys.each do |key|
      write_to_file notes[key], key
    end
    redirect_to notes_success_page_path
  end

  private

  def note_params
    params.require(:notes).permit(:alive, :dead, :to_doctor)
  end

  def write_to_file(text, key)
    return if text.length.zero?
    t = text.split(/\s+/).join("\s")
    File.open("notes/#{key}.txt", 'a') { |f| f.write("#{t}\n") }
  end

  def keys
    %w[alive dead to_doctor]
  end
end
