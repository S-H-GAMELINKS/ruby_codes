tp = TracePoint.new(:line) do |tp|
   if tp.binding.receiver.to_s == "main"
     file = File.open(tp.path)
     line = file.readlines[tp.lineno - 1]
     method_id = line.gsub(/def | |\n/, "")
     if tp.binding.receiver.respond_to?(method_id, true)
        raise "Do not orverride #{method_id}" 
     end
   end
end

tp.enable

def puts 
   p 42 
end


