
public_dir      = "_site"    # compiled site directory
#######################
# Working with Jekyll #
#######################

task :default => [:generate, :local]

desc "Generate jekyll site"
task :generate do
  puts "## Generating Site with Jekyll"
  system "jekyll"
end

desc "Deploy to local site"
task :local do
  puts "## Deploying website to http://mikegriffin.ie/"
  system "rm -rf ~/mikegriffin.ie/current/public"
  system "cp -r #{public_dir} ~/mikegriffin.ie/current/public"
end

