DIR_PATHS = ["./test"]

DIR_PATHS.each do |path|
  rb_all = Dir["#{path}/*.rb"]
  rb_all.each do |file|
    require file
  end
end
