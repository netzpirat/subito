class Submodule

  attr_reader :root
  
  def initialize(root)
    @root = root.parent
  end

  def extension?
    type.to_s == 'extensions'
  end
  
  def plugin?
    type.to_s == 'plugins'
  end
  
  def gem?
    type.to_s == 'gems'
  end
  
  def radiant?
    type.to_s == 'radiant'
  end
    
  def type
    @root.parent.basename
  end
  
  def to_s
    @root.basename
  end
  
end