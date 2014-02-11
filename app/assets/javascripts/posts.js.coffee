$ ->
  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#product_description')

  # to call summernote editor
  summer_note.summernote
  # to set options
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

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#post_content').code()
    summer_note.val summer_note.code()
    true
