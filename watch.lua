local id = location.query.id

local res = fetch({
  url = "https://api.fsh.plus/video?id=" .. id
}):await();

local video = get_id('video')

video.on_load(function()
  if browser.api.media_context then
    video.media_context.play()
  end
end)

video.content = res.body.video