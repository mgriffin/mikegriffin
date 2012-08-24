require 'rubygems'
require 'test/unit'
require 'redgreen'

require 'jekyll'

require '_plugins/photos.rb'

include Jekyll

class TestPhotoSetTag < Test::Unit::TestCase
  def setup
    @photoSet = PhotoSetTag.new("photo_set", "2012-08-23-gallery-test", "")
  end

  def test_photos_returns_an_array
    @expected = 4
    @result = @photoSet.photos.size
    assert_equal @expected, @result
  end
end

class TestPhoto < Test::Unit::TestCase
  def setup
    @photo = Photo.new("images/2012-08-23-gallery-test/test_image-2.jpg")
  end

  def test_returns_a_url
    @expected = "/images/2012-08-23-gallery-test/test_image-2.jpg"
    @result = @photo.url
    assert_equal @expected, @result
  end

  def test_returns_a_thumbnail_url
    @expected = "/images/2012-08-23-gallery-test/thumbs/test_image-2.jpg"
    @result = @photo.thumbnail_url
    assert_equal @expected, @result
  end

  def test_returns_a_title
    @expected = "test_image-2"
    @result = @photo.title
    assert_equal @expected, @result
  end
end
