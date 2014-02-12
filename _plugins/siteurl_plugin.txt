module Jekyll
  class Post
    def to_liquid
      if self.site.config['url']
        @narf = self.site.config['url'] + self.url
      else
        @narf = self.url
      end

      self.data.deep_merge({
        "title" => self.data["title"] || self.slug.split('-').select {|w| w.capitalize! || w }.join(' '),
        "url" => @narf,
        "date" => self.date,
        "id" => self.id,
        "categories" => self.categories,
        "next" => self.next,
        "previous" => self.previous,
        "tags" => self.tags,
        "content" => self.content })
    end
  end
end
