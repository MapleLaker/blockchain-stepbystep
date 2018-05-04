require 'digest'

puts Digest::SHA256.hexdigest("Hello, Cryptos!")
puts Digest::SHA256.hexdigest("This is Friday, haha ...")
puts Digest::SHA256.hexdigest("A")
puts Digest::SHA256.hexdigest("AASDFSAFSAFASFSADFWEFSAFDSADDFSAFDSDFWTSGRTSDFASDFVCVARGTYYTJDGHJDFHSFHAHGADGHDAGAGAFGDFGGGGGGGGGGGGGGGG")
puts Digest::SHA256.hexdigest("Hello, Cryptos!").length
puts Digest::SHA256.hexdigest("This is Friday, haha ...").length
puts Digest::SHA256.hexdigest("A").length

hex = Digest::SHA256.hexdigest("A")
puts hex.to_i(16).to_s(2)
