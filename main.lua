if not browser.api.media_context then
  get_id('disclaimer').content = 'Your browser does not support media context, this api is needed'
else
  get_id('disclaimer').remove()
end