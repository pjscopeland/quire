module PagesHelper
  def note_action_buttons(note)
    content_tag :div, class: 'pull-right btn-group' do
      disable_up = note.id == note.page.notes.first.id
      disable_down = note.id == note.page.notes.last.id
      [
        link_to(icon(:arrow_circle_up, :fw), move_up_note_path(note), method: :put,
                class: "btn btn-default q-move-up#{' disabled' if disable_up}"),
        link_to(icon(:arrow_circle_down, :fw), move_down_note_path(note), method: :put,
                class: "btn btn-default q-move-down#{' disabled' if disable_down}"),
        link_to(icon(:edit, :fw), edit_note_path(note), class: 'btn btn-default'),
        link_to(icon(:trash_o, :fw), note, action: :destroy, class: 'btn btn-default', method: :delete,
                data: {confirm: 'Are you sure?'})
      ].join.html_safe
    end
  end
end
