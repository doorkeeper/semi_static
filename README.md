# SemiStatic: A simple text-file based CMS for Rails

In our internal projects, such as [Doorkeeper](http://www.doorkeeperhq.com/), we have had the need to generate lots of text content, such as news entries or FAQ pages. SemiStatic provides you with an easy way to manage such content.

## Usage

### Gemfile

``` ruby
gem 'semi_static'
```

### config/routes.rb

``` ruby
semi_static_for :article
```

### app/models/article.rb

``` ruby
class Article < SemiStatic::News
end
```

### semi_static_pages/news/foo.md
``` markdown
title: This is the title
slug: this-is-a-slug
published_at: 2013-01-31
...
This is the body.
```
