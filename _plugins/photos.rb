module Jekyll
  class PhotoSetTag < Liquid::Tag
    def initialize(tag_name, config, token)
      super

      @gallery = config.split[0]

      @config = Jekyll.configuration({})['photo_set'] || {}
    end

    def render(context)
      <<-EOF
      #{photos.collect{|photo| render_thumbnail(photo)}}
      EOF
    end

    def render_thumbnail(photo)
      <<-EOF
      <li>
        <a class="thumb" href="#{photo.url}" title="#{photo.title}">
          <img src="#{photo.thumbnail_url}" alt="#{photo.title}"/>
        </a>
        <div class="caption">
          <div class="download">
            <a href="#{photo.url}">Download Original</a>
          </div>
          <div class="image-title">#{photo.title}</div>
        </div>
      </li>
      EOF
    end

    def photos
      @photos = Array.new

      Dir.glob("images/#{@gallery}/*.jpg") do |img|
        @photos << Photo.new(img)
      end

      @photos.sort
    end
  end

  class Photo
    def initialize(url)
      @url = "/#{url}"
      @thumbnail_url  = url.gsub(/(images\/[^\/]+)\/(\S+)/i, "/\\1/thumbs/\\2")
      @title = url.gsub(/images\/[^\/]+\/(\S+)\.jpg/i, "\\1")
    end

    def url
      return @url
    end

    def thumbnail_url
      return @thumbnail_url
    end

    def title
      return @title
    end

    def <=>(photo)
      @url <=> photo.url
    end
  end
end

Liquid::Template.register_tag('photo_set', Jekyll::PhotoSetTag)
