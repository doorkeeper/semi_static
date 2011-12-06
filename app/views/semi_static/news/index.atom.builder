atom_feed do |feed|
  feed.title controller.resource.feed_title
  feed.updated @articles.first.published_at
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.render(self), :type => "html")
    end
  end
end
