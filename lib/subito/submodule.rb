class Submodule

  attr_reader :root
  
  def initialize(root)
    @root = root.gsub(/\/\.git/,'')
  end

  def to_s
    @root
  end
  
end