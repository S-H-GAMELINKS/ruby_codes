def export(*args)
  result = {}
  args.map{
    result[_1.to_s.to_sym] = _1
  }
  result
end

class V1
  @@value = 42

  def self.value
    @@value
  end
end

class V2
  @@value = 21
end

@exports = export V1, V2

@exports in { V1: value1 }

p value1.value
