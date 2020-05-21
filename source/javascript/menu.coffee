window.Menu = class Menu

  constructor: (element) ->
    @$element = $(element)
    @$element.find(".js-open").click(@toggle)

  toggle: => if @$element.hasClass("open") then @close() else @open()

  open: -> @$element.addClass("open")

  close: -> @$element.removeClass("open")