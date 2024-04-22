# Mastodon-comments Extension For Quarto
This extension adds Mastodon Comments enabled by [dpecos' implementation.](https://github.com/dpecos/mastodon-comments?tab=readme-ov-file)

## Installing

```sh
quarto install extension AndreasThinks/quarto-mastodon-comments
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Add the following to the yaml header of your document.
You can set options to `false` if you don't want to display the respective share button.

```yaml
filters:
  - mastodon-comments
share:
  user: "AndreasThinks"
  host: "fosstodon.org"
  toot_id: "111995180253316042"
```