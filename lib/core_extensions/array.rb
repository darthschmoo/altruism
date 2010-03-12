class Array
  # reverses the meaning of the standard grep function
  # so that items that would be matched are not matched
  # and vice versa.
  def grepv expr, &block
    if block_given?
      yield self - self.grep(expr)
    else
      self - self.grep(expr)
    end
  end
end
