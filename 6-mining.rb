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
