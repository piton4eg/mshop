$ ->
  # set summernote object
  summer_note = $('#product_description, #post_value')

  # call summernote editor
  summer_note.summernote
  # set options
    height:300
    lang:'ru-RU'
    toolbar: [
#      ['insert', ['picture', 'link']],
      ['insert', ['link']],
#      ["table", ["table"]],
      ["style", ["style"]],
      ["fontsize", ["fontsize"]],
#      ["color", ["color"]],
      ["style", ["bold", "italic", "underline", "clear"]],
#      ["para", ["ul", "ol", "paragraph"]],
      ["height", ["height"]],
      ["help", ["help"]]
      ]

  # set code for summernote
  summer_note.code summer_note.val()

  # get code for summernote
  summer_note.closest('form').submit ->
    summer_note.val summer_note.code()
    true
