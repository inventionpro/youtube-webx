local id = window.query.id

local res = fetch({
  url = "https://api.fsh.plus/video?id=" .. id
});
get('video').set_source(res.video)