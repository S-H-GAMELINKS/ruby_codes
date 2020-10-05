class R
  def hoge
    p :hoge
  end
end

r = R.new

r.hoge

module RefineR
  refine R do
    def hoge 
      p :hogehoge
    end
  end
end

using RefineR

r.hoge

module RefineRefineR
  refine R do
    def hoge
      p :hogehogehoge
    end
  end
end

using RefineRefineR

r.hoge
