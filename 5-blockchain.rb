require 'digest'
require 'pp'
require 'test/unit'

class Block
	attr_reader :data
	attr_reader :prev
	attr_reader :difficulty
	attr_reader :time
	attr_reader :nonce

	def initialize(data, prev, difficulty: '00000')
		@data = data
		@prev = prev
		@difficulty = difficulty
		@time,@nonce = compute_hash_with_proof_work(difficulty)
	end

	def compute_hash_with_proof_work ( difficulty = '00')
		nonce = 0
		time = Time.now.to_i()
		loop do
			hash = Digest::SHA256.hexdigest("#{nonce}#{time}#{difficulty}#{prev}#{data}")

			if hash.start_with?(difficulty)
				return [time,nonce]
			else
				nonce = nonce + 1
			end
		end
	end

	def hash
		hash = Digest::SHA256.hexdigest("#{nonce}#{time}#{difficulty}#{prev}#{data}")
		return hash
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
pp b1

b2 = Block.new("spend 200", b1.hash)
pp b2

b3 = Block.new("spend 300", b2.hash)
pp b3

b4 = Block.new("spend 400", b3.hash)
pp b4


# validate hash
hash1 = sha("#{b1.nonce}#{b1.time}#{b1.difficulty}#{b1.prev}#{b1.data}")
hash2 = sha("#{b2.nonce}#{b2.time}#{b2.difficulty}#{b2.prev}#{b2.data}")
hash3 = sha("#{b3.nonce}#{b3.time}#{b3.difficulty}#{b3.prev}#{b3.data}")
hash4 = sha("#{b4.nonce}#{b4.time}#{b4.difficulty}#{b4.prev}#{b4.data}")
equal(b1.hash, hash1 )
equal(b2.hash, hash2 )
equal(b3.hash, hash3 )
equal(b4.hash, hash4 )

#validate difficuty
pp b1.hash.start_with?(b1.difficulty)
pp b2.hash.start_with?(b2.difficulty)
pp b3.hash.start_with?(b3.difficulty)
pp b4.hash.start_with?(b4.difficulty)

# validate time is younger
pp b2.time > b1.time
pp b3.time > b2.time
pp b4.time > b3.time
pp Time.now.to_i >= b4.time

#hacker 1
b2.setData("not spend 200")

# strong validation - recal all value
hash1 = sha("#{b1.nonce}#{b1.time}#{b1.difficulty}#{b1.prev}#{b1.data}")
hash2 = sha("#{b2.nonce}#{b2.time}#{b2.difficulty}#{b2.prev}#{b2.data}")
hash3 = sha("#{b3.nonce}#{b3.time}#{b3.difficulty}#{b3.prev}#{b3.data}")
hash4 = sha("#{b4.nonce}#{b4.time}#{b4.difficulty}#{b4.prev}#{b4.data}")
equal(b2.prev, hash1 )
equal(b3.prev, hash2 )
equal(b4.prev, hash3 )

#hacker 2 - unless hacker has to rebuild all the next blocks 
b3_fake = Block.new("spend 300", b2.hash)
pp b3_fake

b4_fake = Block.new("spend 400", b3.hash)
pp b4_fake



