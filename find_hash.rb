require 'digest'
require 'OpenSSL'


def gen_pass(hash_value)



	alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789#{}!\"#@$§_:;,?%&'()*+-/.";
	last_character = alphanum[-1,1]
	count = 0;

	fic = File.open("hashlist.txt", "r");

	fic.each_line do |ligne|
	#Request for the medata in the website
		word, hash_ligne = ligne.split(" ")
		puts hash_ligne

		if hash_ligne.to_s.upcase == hash_value
			puts "**********************************************************"
			abort ("MATCH FOUND: "+ word)
					
		end

	end
	puts "**********************************************************"
	abort ("NO MATCH FOUND")

end


#argument should be the hash value of the password
input_array = ARGV
hash_value = input_array[0]

gen_pass(hash_value);
