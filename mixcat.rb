contents   = []
max_lineno = 0

while line = ARGF.gets
  if max_lineno < (lineno = ARGF.file.lineno)
    max_lineno = lineno
  end

  contents << Hash[lineno, line]
end

1.upto(max_lineno) do |i|
  lines = contents.find_all {|c| c.key?(i) }
  lines.each {|m| puts m.values }
end
