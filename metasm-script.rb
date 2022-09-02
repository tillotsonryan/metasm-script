require 'metasm'
require 'rex'
payload = <<-EOS
	mov al, 0x1
	int 0x80 # let return code be garbage
EOS

sc = Metasm::Shellcode.assemble(Metasm::X86.new, payload).encode_string
filename = "#{Rex::Text.rand_text_alpha_lower(8)}.c"
f = File.new(filename,  "w")
f.puts Rex::Text.to_c(sc)
f.close
