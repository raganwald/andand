Gem::Specification.new do |s|
  s.name = "andand"
  s.version = "1.3.3"
  s.date = "2012-03-28"
  s.summary = "The Maybe Monad in idiomatic Ruby"
  s.email = "reg@braythwayt.com"
  s.homepage = "http://github.com/raganwald/andand/"
  s.description = " Maybe Monad in idiomatic Ruby."
  s.authors = ["Reg Braithwaite"]
  s.files = ["History.txt",
             "License.txt",
             "README.textile",
             "lib/andand.rb",
             "lib/andand/version.rb"]
  s.test_files = [
      "test/andand_spec.rb",
      "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.textile"]
  s.extra_rdoc_files = ["History.txt", "README.textile"]
end
