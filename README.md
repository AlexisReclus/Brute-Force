# Brute Force Algorithm

## brute_force.rb

This algorithm follow this steps:
1. It uses a hash function (sha256, md5 etc..) and a hash value (you can manually create using a hash geenrator or if you intercept it in the network).
2. Using a function and passing a maximum size as a function argument, it tries to brute force the hash value, using all the characters and the combination in the keyboard until the maximum size. 

Example of use:
````
ruby brute_force.rb sha256 1E262CD7D110812F5726055A6E672B92CDE43648B76ADFF51A12441FBDF7E667
````

## hash_calculating.rb
You give to this program a hash function in argument (sha256, md5 etc..) and it generates for you a hashlist.txt containing all the hashes values for all the word containing until 3 characters (you can change the size in the gen__pass(3, hash_algorithm)) line.

Example of use:
`````
ruby hash_calculating.rb md5
``````
Be sure hashlist.txt is unestiting or void when you launch this program.


## find_hash.rb
To launch this algorithm, you need to be sure hash_calculating has been executed before. If you execute the program:

1. It uses a hash value (you can manually create using a hash geenrator or if you intercept it in the network).
2. Using a function and passing a size as an argument, it tries to find the hash value, using all the hash values in hashlist.txt already created using the hash_calculating.rb function.

```
ruby find_hash.rb 080F651E3FCCA17DF3A47C2CECFCB880
````
