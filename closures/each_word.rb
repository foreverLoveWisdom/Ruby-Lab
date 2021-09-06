class String
  def each_word(&block)
    split(' ').each(&block)
  end
end

'Nothing lasts forever but cold November Rain'.each_word do |x|
  puts x
end
