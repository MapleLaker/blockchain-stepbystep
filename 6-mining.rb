require 'digest'

#pow
def compute_hash_with_proof_of_work( data, difficulty='00' )
  nonce = 0
  loop do
    hash = Digest::SHA256.hexdigest( "#{nonce}#{data}" )
    if hash.start_with?( difficulty )
      return [nonce,hash]    ## bingo! proof of work if hash starts with leading zeros (00)
    else
      nonce += 1             ## keep trying (and trying and trying)
    end
  end # loop
end # method compute_hash_with_proof_of_work

#adjust difficulty
(1..7).each do |factor|
	difficuty = '0' * factor
	puts "difficuty is #{difficuty} (#{difficuty.length*4} bits)"


	puts "Start searching..."
	t1 = Time.now
	nonce, hash = compute_hash_with_proof_of_work( 'Hello, Cryptos!', difficuty)
	t2 = Time.now

	delta = t2 - t1
	puts("Elapse time is %.4f seconds, Hashes calculated %d " % [delta, nonce])

	if (delta > 0)
		hashrate = Float(nonce / delta)
		puts("Hash rate is %d hashes per seconds" % hashrate)
	end

end

=begin
difficuty is 0 (4 bits)
Start searching...
Elapse time is 0.0000 seconds, Hashes calculated 56
difficuty is 00 (8 bits)
Start searching...
Elapse time is 0.0000 seconds, Hashes calculated 143
difficuty is 000 (12 bits)
Start searching...
Elapse time is 0.0000 seconds, Hashes calculated 3834
difficuty is 0000 (16 bits)
Start searching...
Elapse time is 0.0468 seconds, Hashes calculated 26762
Hash rate is 571837 hashes per seconds
difficuty is 00000 (20 bits)
Start searching...
Elapse time is 0.2184 seconds, Hashes calculated 118592
Hash rate is 543003 hashes per seconds
difficuty is 000000 (24 bits)
Start searching...
Elapse time is 31.8729 seconds, Hashes calculated 21554046
Hash rate is 676250 hashes per seconds
difficuty is 0000000 (28 bits)
Start searching...
=end
