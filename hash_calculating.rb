require 'digest'
require 'OpenSSL'


def gen_pass(len, hash_algorithm)

alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789#{}!\"#@$§_:;,?%&'()*+-/.";
last_character = alphanum[-1,1]

for i in 1..len
	array = Array.new(i, 0);
	#puts array[0]
	my_pass = Array.new(i);

	while (my_pass.join.to_s != Array.new(i,last_character).join.to_s)

		for l in 0..i-1
			my_pass[l] = alphanum[array[l]]
		end

		array[l] = (array[l] + 1);

		result = OpenSSL::Digest.hexdigest(hash_algorithm, my_pass.join.to_s)
		#puts result

		open('hashlist.txt','a') { |f|
		f.puts my_pass.join.to_s + " " + result
		}

		puts my_pass.join.to_s

		for j in 0..array.length-1
			if (array[j] == alphanum.length)
				for k in j..array.length-1
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

gen_pass(3, hash_algorithm);
