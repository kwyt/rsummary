class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def yellow
    colorize(33)
  end
end
