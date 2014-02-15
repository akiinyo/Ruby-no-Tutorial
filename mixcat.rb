contents     = []
file_content = []

while line = ARGF.gets
  file_content << line

  if ARGF.eof?
    contents << file_content
    file_content = []
  end
end

max_lineno = contents.map {|c| c.size }.max

max_lineno.times do |i|
  puts contents.map {|content| content[i] }.join
end
