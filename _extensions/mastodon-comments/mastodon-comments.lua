local function ensureHtmlDeps()
  quarto.doc.addHtmlDependency({
      name = 'mastodon-comments',
      version = '1.0.0',
      stylesheets = {
          'mastodon-comments.css'
      }
  })
end

function Meta(m)
  ensureHtmlDeps()
  if m.share and m.share.user and m.share.toot_id and m.share.host then
      local user = pandoc.utils.stringify(m.share.user)
      local toot_id = pandoc.utils.stringify(m.share.toot_id)
      local host = pandoc.utils.stringify(m.share.host)
      local mastodon_html = '<mastodon-comments host="' .. host .. '" user="' .. user .. '" tootId="' .. toot_id .. '" style="width : 1024px"></mastodon-comments>'

      -- Include Mastodon comments HTML after the body
      quarto.doc.includeText("after-body", mastodon_html)

      -- Include external scripts and styles directly
      local script_html = '<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.4.1/purify.min.js" integrity="sha512-uHOKtSfJWScGmyyFr2O2+efpDx2nhwHU2v7MVeptzZoiC7bdF6Ny/CmZhN2AwIK1oCFiVQQ5DA/L9FSzyPNu6Q==" crossorigin="anonymous"></script>'
      local css_html = '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">'
      local local_css_html = '<link rel="stylesheet" href="_extensions/mastodon-comments/mastodon-comments.css">'

      -- Insert these elements in the document's head
      quarto.doc.includeText("in-header", script_html .. css_html .. local_css_html)
      
  end
end
