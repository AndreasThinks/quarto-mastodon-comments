# Mastodon-comments for Quarto
This extension adds Mastodon Comments based on [the excellent webcomponent by dpecos.](https://github.com/dpecos/mastodon-comments?tab=readme-ov-file) You can see (and leave a comment on) a [working example on my blog here.](https://andreasthinks.me/posts/quarto_comments/)

## Installing

```sh
quarto install extension AndreasThinks/quarto-mastodon-comments
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

1. To add comments to your post, you must first create a post about your content (for example, an announcement post). You can click on this post to obtain the relevant "toot id" from the URL.
2. Create a post on your quarto blog, and add the below to your post, with the relevant username, server and toot id.
3. Render and publish your post. You should now see the comments section at the bottom of your post.

```yaml
filters:
  - mastodon-comments
mastodon_comments:
  user: "AndreasThinks"
  host: "fosstodon.org"
  toot_id: "111995180253316042"
```
