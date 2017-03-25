defmodule Simple do

  def decrypt do
    {:ok, key} = File.read("key")
    {:ok, iv} = File.read("iv")
    {:ok, encrypted} = File.read("encrypted")
    :crypto.block_decrypt(:aes_cbc256, key, iv, encrypted)
  end

end

IO.inspect Simple.decrypt

# ** (ErlangError) erlang error: :notsup
#    :crypto.block_crypt_nif(:aes_cbc256, "f0663dc528d0bbcb97dfcf90ed9fe8b56266511a308ac95e24a1f15befb5b198d9f9f90ff2bcfd99a66c60003b439a2d02aa2de37544a71d0d5569380b8f14f8", <<22, 4, 86, 72, 112, 170, 84, 171, 90, 42, 254, 17, 231, 62, 236, 149>>, <<150, 61, 47, 18, 155, 136, 34, 34, 30, 183, 103, 197, 248, 47, 213, 70, 70, 57, 166, 146, 155, 245, 172, 49, 161, 58, 55, 52, 167, 166, 253, 56>>, false)
#    decrypt-with-elixir.rb:12: (file)
#    (elixir) lib/code.ex:370: Code.require_file/2


# ^ Seems to indicate aes_cbc256 is not supported?
# But :crypto.supports returns:
#
#[hashs: [:sha, :sha224, :sha256, :sha384, :sha512, :md4, :md5, :ripemd160],
# ciphers: [:des3_cbc, :des_ede3, :des3_cbf, :des3_cfb, :aes_cbc, :aes_cbc128,
#  :aes_cfb8, :aes_cfb128, :aes_cbc256, :aes_ctr, :aes_ecb, :aes_ige256,
#  :des_cbc, :des_cfb, :des_ecb, :blowfish_cbc, :blowfish_cfb64, :blowfish_ofb64,
#  :blowfish_ecb, :rc2_cbc, :rc4, :aes_gcm],
# public_keys: [:rsa, :dss, :dh, :ec_gf2m, :ecdsa, :ecdh, :srp]]

# which indicates it is. Any ideas?
