local numSuffixes = {
  {1e12, "T"},
  {1e9, "B"},
  {1e6, "M"},
  {1e3, "k"}
}
function shortenNumber(n)
  for _, s in ipairs(numSuffixes) do
    local value, suffix = s[1], s[2]
    if n >= value then
      local shortened = math.floor(n / (value / 10)) / 10
      return string.format("%.1f%s", shortened, suffix)
    end
  end
  return tostring(n)
end

if not browser.api.media_context then
  get_id('disclaimer').content = 'Your browser does not support media context, this api is needed'
else
  get_id('disclaimer').remove()

  get_id('query').on_submit(function(value)
    value = string.gsub(value, "%+", "%%2B")
    local res = fetch({
      url = "https://api.fsh.plus/ytsearch?query=" .. value
    }):await();
    res = res.body.videos

    local html = ''
    for i, v in ipairs(res) do
      html = html .. '<a href="buss://youtube.app/watch?id=' .. v.videoId .. '"><img src="' .. v.thumbnail .. '"><span>' .. v.timestamp .. '</span><div><b>' .. v.title
        .. '</b><span>' .. v.author.name .. '</span><div><span>' .. shortenNumber(v.views) .. ' views</span>' .. v.ago .. '</div></a>'
    end
  end)
end