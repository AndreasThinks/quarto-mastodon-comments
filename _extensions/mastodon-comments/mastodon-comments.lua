local function ensureHtmlDeps()
  quarto.doc.addHtmlDependency({
      name = 'mastodon-comments',
      version = '1.0.0',
      scripts = {"mastodon-comments.js"},
  })
end

function Meta(m)
  ensureHtmlDeps()
  if m.mastodon_comments and m.mastodon_comments.user and m.mastodon_comments.toot_id and m.mastodon_comments.host then
      local user = pandoc.utils.stringify(m.mastodon_comments.user)
      local toot_id = pandoc.utils.stringify(m.mastodon_comments.toot_id)
      local host = pandoc.utils.stringify(m.mastodon_comments.host)
      local mastodon_html = '<mastodon-comments host="' .. host .. '" user="' .. user .. '" tootId="' .. toot_id .. '" style="width : 1024px"></mastodon-comments>'

      -- JavaScript to inject Mastodon comments into a specific div
      local inject_script = [[
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
  var div = document.getElementById('quarto-content');
  if(div) {
    div.innerHTML += `]] .. mastodon_html .. [[`;
  }
});
</script>
]]

      -- Include external scripts and styles directly
      local script_html = '<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.4.1/purify.min.js" integrity="sha512-uHOKtSfJWScGmyyFr2O2+efpDx2nhwHU2v7MVeptzZoiC7bdF6Ny/CmZhN2AwIK1oCFiVQQ5DA/L9FSzyPNu6Q==" crossorigin="anonymous"></script>'
      local css_html = '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">'

      -- Insert these elements in the document's head
      quarto.doc.includeText("in-header", script_html .. css_html .. inject_script)

      -- JavaScript variable definitions
      local js_vars = '<script type="text/javascript">\n' ..
      'var mastodonHost = "' .. host .. '";\n' ..
      'var mastodonUser = "' .. user .. '";\n' ..
      'var mastodonTootId = "' .. toot_id .. '";\n' ..
      '</script>'

      -- Include JavaScript variables in the header
      quarto.doc.includeText("in-header", js_vars)
  end
end
