code = <<'CODE'
varname = "foo"
x = "ABC"
eval("#{varname} = x; p #{varname}")
CODE

puts RubyVM::InstructionSequence.compile(code).disasm
