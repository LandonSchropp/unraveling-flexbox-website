import './carousel'
import './fast-click.coffee'
import './menu.coffee'
import './scrollable-anchor.coffee'

$ ->
  window.menu = new Menu("#menu")

  # Always close the menu when an anchor is clicked.
  $("a").click -> window.menu.close()

  # Scroll anchor hashes on the page.
  $("a").scrollableAnchor()
