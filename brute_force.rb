require 'digest'
require 'OpenSSL'


def gen_pass(len, hash_algorithm, hash_value)

alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789#{}!\"#@$§_:;,?%&'()*+-/.";
last_character = alphanum[-1,1]

for i in 1..len
	array = Array.new(i, 0);
	#puts array[0]
	my_pass = Array.new(i);

	while (my_pass.join.to_s != Array.new(i,last_character).join.to_s)

		for j in 0..i-1
			my_pass[j] = alphanum[array[j]]
		end
		array[j] = (array[j] + 1);

		result = OpenSSL::Digest.hexdigest(hash_algorithm, my_pass.join.to_s)
		if (result == hash_value || result.upcase == hash_value)
			abort("MATCH FOUND, PASSWORD IS: " + my_pass.join.to_s);
		end
		#puts result

		puts my_pass.join.to_s

		for j in 0..array.length
			if (array[j] == alphanum.length)
				for k in j..array.length
					array[k] = 0
				end
				array[j-1] += 1; 
			end
		end
	end

end

end



#argument should be MD5 or SHA256 and the hash value of the password
input_array = ARGV
hash_algorithm = input_array[0]
hash_value = input_array[1]


result = OpenSSL::Digest.hexdigest(hash_algorithm, "abc")

result2 = Digest::MD5.hexdigest 'abc'  

puts result 
puts result2

gen_pass(6, hash_algorithm, hash_value);



