require 'watir'
require 'webdrivers'
require 'faker'
browser = Watir::Browser.new
browser.goto "https://www.youtube.com"
browser.element(tag_name:'paper-button', id:'button', class: ['style-scope', 'ytd-button-renderer', 'style-suggestive', 'size-small']).click
browser.text_field(id: 'identifierId').set('em')
browser.div(id: 'identifierNext').click
browser.text_field(name: 'password').set('pw')
browser.div(id: 'passwordNext').click
browser.goto "https://www.youtube.com/playlist?list=WL"
browser.element(tag_name:'paper-button', id:'button', class: ['style-scope', 'ytd-button-renderer', 'style-suggestive', 'size-small']).click
  menus = browser.elements(tag_name:'ytd-menu-renderer', class: [ 'style-scope', 'ytd-playlist-video-renderer'])
  menus.each do |m|
    m.click
    browser.element(tag_name:'yt-formatted-string', visible_text: 'Remove from Watch later').click
    sleep(0.5)
  end
browser.close

