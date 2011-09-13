require "rubygems"
require "bundler/setup"
require "stringex"

public_dir      = "_site"    # compiled site directory
#######################
# Working with Jekyll #
#######################

task :default => [:generate, :local]

desc "Generate jekyll site"
task :generate do
  puts "## Generating Site with Jekyll"
  FileUtils.rm_rf("_site")
  system "jekyll"
end

desc "Deploy to local site"
task :local do
  puts "## Deploying website to http://mikegriffin.ie/"
  system "rm -rf ~/mikegriffin.ie/current/public"
  system "cp -r #{public_dir} ~/mikegriffin.ie/current/public"
end

desc "Begin a new post"
task :post do
  require './_plugins/titlecase.rb'
  title = ask("Title: ", false)
  title = "New Post" if title.empty?
  mkdir_p "images/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}" if ask("Do you have images?", ['y', 'n']) == 'y'
  filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.markdown"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;').titlecase}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "comments: true"
    post.puts "categories: "
    post.puts "---"
  end
end

desc "Make thumbnails for all posts"
task :pics do
  Dir.chdir('images') do
    Dir['*/'].map do |d|
      Dir.chdir(d) do
        puts Dir.pwd
        FileUtils.mkdir_p('thumbs') unless File.directory?('thumbs')
        Dir.glob('*.jpg') do |image|
          dest = File.join('thumbs', image)
          unless File.exists?(dest)
            system("convert -format jpg -quality 75 -resize \"640x480>\" -strip #{image} #{dest}")
            puts "#{image} converted"
          end
        end
      end
    end
  end
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
