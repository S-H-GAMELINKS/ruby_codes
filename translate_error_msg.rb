def translate(msg)
    case msg
        when /uninitialized constant/
            return msg.gsub(/#{$&}/, "定義されていない定数") + " があります"
        when /undefined local variable or method/
            return msg.gsub(/#{$&}/, "定義されていない変数またはメソッド").gsub(/ for /, " が ").sub(/`|'/, "").gsub(/for/, "") + " にあります"
        when /undefined method/
            return msg.gsub(/#{$&}/, "定義されていないメソッド").gsub(/ for /, " が ").gsub(/`|'/, "") + " にあります"
        when /uninitialized class variable/
            return msg.gsub(/#{$&}/, "初期化されていないクラス変数").gsub(/ for.+$/, "").gsub(/ in /, " が ") + " クラスにあります"
    end 
end

trace = TracePoint.new(:raise) do |tp|
    lineno = tp.lineno
    path   = tp.path
    msg = tp.raised_exception.message
    puts "例外:#{tp.raised_exception.class} が発生しました"
    puts "ソースコード: #{path} の #{lineno.to_s} 行目にエラーの原因があります"
    
    msg = translate(msg) 
    puts msg
end

trace.enable

