# qutebrowser config

config.load_autoconfig(False)

c.auto_save.session = True
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = 'dark'
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history']
c.content.autoplay = False
c.scrolling.bar = 'when-searching'
c.tabs.background = True
c.tabs.last_close = 'startpage'
c.url.default_page = 'https://www.google.com'
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
}
c.url.start_pages = ['https://www.google.com']

config.bind('<z><l>', 'spawn --userscript qute-rbw fill')
config.bind('<z><u>', 'spawn --userscript qute-rbw username')
config.bind('<z><p>', 'spawn --userscript qute-rbw password')
config.bind('<z><t>', 'spawn --userscript qute-rbw totp')
config.bind('<z><m>', 'spawn --userscript qute-mpv')

bg = '#000000'
fg = '#eeffff'
gray = '#202020'
darkgray = '#303030'
alt_bg = '#353535'
red = '#f07178'
green = '#13ca91'
yellow = '#fdf200'
blue = '#7898fb'
magenta = '#ff2079'
cyan = '#00feca'
orange = '#f78c6c'
pink = '#ff5370'
white = '#ffffff'

c.colors.completion.category.bg = bg
c.colors.completion.category.border.bottom = gray
c.colors.completion.category.border.top = gray
c.colors.completion.category.fg = green
c.colors.completion.even.bg = bg
c.colors.completion.fg = fg
c.colors.completion.item.selected.bg = green
c.colors.completion.item.selected.border.bottom = green
c.colors.completion.item.selected.border.top = green
c.colors.completion.item.selected.fg = bg
c.colors.completion.item.selected.match.fg = bg
c.colors.completion.match.fg = green
c.colors.completion.odd.bg = bg
c.colors.completion.scrollbar.bg = bg
c.colors.completion.scrollbar.fg = gray

c.colors.contextmenu.disabled.bg = bg
c.colors.contextmenu.disabled.fg = darkgray
c.colors.contextmenu.menu.bg = bg
c.colors.contextmenu.menu.fg = fg
c.colors.contextmenu.selected.bg = green
c.colors.contextmenu.selected.fg = bg

c.colors.downloads.bar.bg = bg
c.colors.downloads.error.bg = red
c.colors.downloads.error.fg = bg
c.colors.downloads.start.bg = blue
c.colors.downloads.start.fg = bg
c.colors.downloads.stop.bg = green
c.colors.downloads.stop.fg = bg
c.colors.downloads.system.bg = 'none'
c.colors.downloads.system.fg = 'none'

c.colors.hints.bg = yellow
c.colors.hints.fg = bg
c.colors.hints.match.fg = magenta

c.colors.keyhint.bg = bg
c.colors.keyhint.fg = fg
c.colors.keyhint.suffix.fg = green

c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.error.fg = bg
c.colors.messages.info.bg = bg
c.colors.messages.info.border = gray
c.colors.messages.info.fg = fg
c.colors.messages.warning.bg = orange
c.colors.messages.warning.border = orange
c.colors.messages.warning.fg = bg

c.colors.prompts.bg = bg
c.colors.prompts.border = '1px solid ' + gray
c.colors.prompts.fg = fg
c.colors.prompts.selected.bg = green
c.colors.prompts.selected.fg = bg

c.colors.statusbar.caret.bg = magenta
c.colors.statusbar.caret.fg = bg
c.colors.statusbar.caret.selection.bg = pink
c.colors.statusbar.caret.selection.fg = bg
c.colors.statusbar.command.bg = bg
c.colors.statusbar.command.fg = fg
c.colors.statusbar.command.private.bg = bg
c.colors.statusbar.command.private.fg = magenta
c.colors.statusbar.insert.bg = blue
c.colors.statusbar.insert.fg = bg
c.colors.statusbar.normal.bg = bg
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.passthrough.bg = cyan
c.colors.statusbar.passthrough.fg = bg
c.colors.statusbar.private.bg = bg
c.colors.statusbar.private.fg = magenta
c.colors.statusbar.progress.bg = green
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.fg = fg
c.colors.statusbar.url.hover.fg = cyan
c.colors.statusbar.url.success.http.fg = fg
c.colors.statusbar.url.success.https.fg = green
c.colors.statusbar.url.warn.fg = yellow

c.colors.tabs.bar.bg = bg
c.colors.tabs.even.bg = bg
c.colors.tabs.even.fg = fg
c.colors.tabs.indicator.error = red
c.colors.tabs.indicator.start = blue
c.colors.tabs.indicator.stop = green
c.colors.tabs.odd.bg = bg
c.colors.tabs.odd.fg = fg
c.colors.tabs.pinned.even.bg = gray
c.colors.tabs.pinned.even.fg = fg
c.colors.tabs.pinned.odd.bg = gray
c.colors.tabs.pinned.odd.fg = fg
c.colors.tabs.pinned.selected.even.bg = green
c.colors.tabs.pinned.selected.even.fg = bg
c.colors.tabs.pinned.selected.odd.bg = green
c.colors.tabs.pinned.selected.odd.fg = bg
c.colors.tabs.selected.even.bg = green
c.colors.tabs.selected.even.fg = bg
c.colors.tabs.selected.odd.bg = green
c.colors.tabs.selected.odd.fg = bg

c.colors.webpage.bg = bg

c.fonts.default_family = 'Iosevka Nerd Font'
c.fonts.default_size = '10pt'
