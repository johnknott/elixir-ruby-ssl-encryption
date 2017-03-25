require 'openssl'

data  = "An example string"
key   = "f0663dc528d0bbcb97dfcf90ed9fe8b56266511a308ac95e24a1f15befb5b198d9f9f90ff2bcfd99a66c60003b439a2d02aa2de37544a71d0d5569380b8f14f8"

# Ecnrypt the string using SSL aes-256-cbc
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.encrypt
cipher.key = key
cipher.iv = iv = cipher.random_iv
encrypted = cipher.update(data) + cipher.final

puts "Encrypted: #{encrypted}"

# Test that decryption works in Ruby
cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.decrypt
cipher.key = key
cipher.iv = iv
decrypted = cipher.update(encrypted) + cipher.final
puts "Decrypted: #{decrypted}"

# Write the important components out intoa file so Elixir can read them
File.write('key', key)
File.write('iv', iv)
File.write('encrypted', encrypted)