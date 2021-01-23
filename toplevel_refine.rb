module Kernel
    module_function
    def refine klass, &block
        Module.new do
           refine klass do
              class_eval(&block)
           end
        end
    end
end

using refine(Integer) { 
   def hoge
      p :hoge 
   end
}

42.hoge
# => :hoge
