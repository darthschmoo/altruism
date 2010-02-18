class Object
  def umethods
    methods.sort - Object.new.methods
  end
end
