module Klass
  @@klasses = {}
  def export(*klasses)
    klasses.each{
      @@klasses[_1.to_s.to_sym] = _1
    }
  end

  def import
    @@klasses
  end
end

class C1
  def self.value
    42
  end
end

class C2
  def self.value
    21
  end
end

include Klass

export C1, C2

import in { C1: c1, C2: c2 }

p c1.value
p c2.value
