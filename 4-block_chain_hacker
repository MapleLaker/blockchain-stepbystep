require 'digest'
require 'pp'
require 'test/unit'

class Block
	attr_reader :data
	attr_reader :hash
	attr_reader :prev
	attr_reader :nonce

	def initialize(data,prev)
		@data = data
		@prev = prev
		@hash,@nonce = compute_hash_with_proof_work
	end

	def compute_hash_with_proof_work ( difficulty = '00')
		nonce = 0

		loop do
			hash = Digest::SHA256.hexdigest("#{nonce}#{prev}#{data}")

			if hash.start_with?(difficulty)
				return [hash,nonce]
			else
				nonce = nonce + 1
			end
		end
	end

	def setData (data)
		@data = data
	end
		
end

def equal (s1, s2)
	if s1 == s2
		puts ("#{s1} == #{s2}")
	else
		puts ("#{s1} != #{s2}")
	end
end

def sha (data)
	hash = Digest::SHA256.hexdigest(data)
	return hash

end

# generate block
b1 = Block.new("spend 100","0000000000000000000000000000000000000000000000000000")

b2 = Block.new("spend 200", b1.hash)

b3 = Block.new("spend 300", b2.hash)

b4 = Block.new("spend 400", b3.hash)

#validation
equal(b1.prev, "0000000000000000000000000000000000000000000000000000" )
equal(b2.prev, b1.hash )
equal(b3.prev, b2.hash )
equal(b4.prev, b3.hash )

#hacker 1
b2.setData("not spend 200")

equal(b1.prev, "0000000000000000000000000000000000000000000000000000" )
equal(b2.prev, b1.hash )
equal(b3.prev, b2.hash )
equal(b4.prev, b3.hash )

# strong validation
hash1 = sha("#{b1.nonce}#{b1.prev}#{b1.data}")
hash2 = sha("#{b2.nonce}#{b2.prev}#{b2.data}")
hash3 = sha("#{b3.nonce}#{b3.prev}#{b3.data}")
hash4 = sha("#{b4.nonce}#{b4.prev}#{b4.data}")
equal(b2.prev, hash1 )
equal(b3.prev, hash2 )
equal(b4.prev, hash3 )



