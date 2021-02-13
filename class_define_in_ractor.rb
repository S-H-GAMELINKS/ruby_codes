rac = Ractor.new do
    class Hoge
      def hello
        puts :hoge
      end
    end
    Hoge.new
end

hoge = rac.take
hoge.hello
