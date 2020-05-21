do ($ = jQuery, window, document) ->

  HREF_REGEX = /(.*)#(.*)(?:\?.*)?/i

  defaults =
    scrollTime: 750
    scrollTarget: "html, body"

  # If the user is on the same page as an anchor with a hash, this plugin animates a scroll to the
  # hash instead of jumping there. If the user is not on the same page.
  class ScrollableAnchor

    constructor: (@element, options) ->
      @$element = $(@element)
      @options = $.extend {}, defaults, options
      @$element.click(@anchorClicked)

    anchorClicked: (event) =>

      # Grab the anchor.
      href = $(event.target).closest("a").prop("href")

      # If the HREF exactly matches the current URL sans hash, scroll to the top.
      if (window.location.origin + window.location.pathname) is href
        @scrollTo($("body"))
        event.preventDefault()
        return

      # Ignore the event if the anchor isn't linking to an HREF with a hash.
      matches = href.match(HREF_REGEX)
      return unless matches?

      # Ignore the event if the user isn't on the same page as the HREF.
      # TODO: Update the path to work with HREFs that contain query parameters.
      return unless (window.location.origin + window.location.pathname) is matches[1]

      # Ignore the event if the target ID isn't present on the page.
      $target = $("##{ matches[2] }")
      return unless $target.length

      # Scroll the user to the target element.
      event.preventDefault()
      @scrollTo($target)

    scrollTo: ($target) ->
      $(@options.scrollTarget).animate(

        # HACK: This is a quick hack to position correctly under the menu.
        { scrollTop: $target.prop('offsetTop') - $("#menu").height() },
        @options.scrollTime
      )

  # Instantiate the plugin class and prevent it being initialized more than once for the same
  # element.
  $.fn["scrollableAnchor"] = (options) ->
    @each ->
      unless $.data @, "plugin_scrollableAnchor"
        $.data @, "plugin_scrollableAnchor", new ScrollableAnchor @, options