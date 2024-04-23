# Mastodon-comments for Quarto
This extension adds Mastodon Comments based on [the excellent webcomponent by dpecos.](https://github.com/dpecos/mastodon-comments?tab=readme-ov-file)

## Installing

```sh
quarto install extension AndreasThinks/quarto-mastodon-comments
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Create a Mastodon post about your content, and then add the below to your post, with the relevant username, server and toot id.

```yaml
filters:
  - mastodon-comments
mastodon_comments:
  user: "AndreasThinks"
  host: "fosstodon.org"
  toot_id: "111995180253316042"
```
