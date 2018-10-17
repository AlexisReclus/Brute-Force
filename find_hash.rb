require 'digest'
require 'OpenSSL'


def gen_pass(hash_value)



	alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789#{}!\"#@$§_:;,?%&'()*+-/.";
	last_character = alphanum[-1,1]

	fic = File.open("hashlist.txt", "r");

	fic.each_line do |ligne|
	#Request for the medata in the website
		puts ligne.upcase

		if ligne.delete("\n").upcase == hash_value.upcase
			abort("MATCH FOUND: " + ligne)
		end
	
	end

end


#argument should be MD5 or SHA256 and the hash value of the password
input_array = ARGV
hash_value = input_array[0]

gen_pass(hash_value.delete("\n"));