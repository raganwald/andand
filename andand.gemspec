Gem::Specification.new do |s|
  s.name     = "andand"
  s.version  = "1.3.1"
  s.date     = "2008-11-07"
  s.summary  = "The Maybe Monad in idiomatic Ruby"
  s.email    = "reg@braythwayt.com"
  s.homepage = "http://github.com/raganwald/andand/tree/master"
  s.description = " Maybe Monad in idiomatic Ruby."
  s.authors  = ["Reg Braithwaite"]
  s.files    = ["History.txt",
"License.txt",
"Manifest.txt",
"README.textile",
"Rakefile",
"config/hoe.rb",
"config/requirements.rb",
"lib/andand.rb",
"lib/andand/version.rb",
"log/debug.log",
"script/destroy",
"script/generate",
"script/txt2html",
"setup.rb",
"tasks/deployment.rake",
"tasks/environment.rake"]
  s.test_files = [
"test/test_andand.rb",
"test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.textile"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.textile"]
end
