class TestObject
  def self.table_name
    'test_object'
  end

  def my_name
    'Joe'
  end
end

class TestViewContext
  def render(options)
    options
  end

  def helper_method
  end
end