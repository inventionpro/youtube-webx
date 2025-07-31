local id = location.query.id

local res = fetch({
  url = "https://api.fsh.plus/video?id=" .. id
}):await();
get_id('video').content = res.video

if browser.api.media_context then
  get_id('video').media_context.play()
end