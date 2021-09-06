class File
  def open(filename, mode)
    if block_given?
      new(filename, mode)
    else
      begin
        f = new(filename, mode)
        yield(f)
      ensure
        f.close
      end
    end
  end
end

file = File.open('text.txt', 'w')
puts file.inspect
file = File.open('text.txt', 'w') { |f| f << 'arsarts' }
puts File.read('text.txt')
puts file.inspect
