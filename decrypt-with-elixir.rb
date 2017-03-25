defmodule Simple do

  def decrypt do
    {:ok, key} = File.read("key")
    {:ok, iv} = File.read("iv")
    {:ok, encrypted} = File.read("encrypted")
    :crypto.block_decrypt(:aes_cbc256, key, iv, encrypted)
  end

end

IO.inspect Simple.decrypt