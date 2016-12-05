File.open(File.basename(__FILE__),"r") do |f|
  while line = f.gets
    puts line
  end
end
