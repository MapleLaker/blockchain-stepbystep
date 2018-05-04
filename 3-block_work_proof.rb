require 'digest'
require 'pp'

class Block
	attr_reader :data
	attr_reader :hash
	attr_reader :nonce

	def initialize(data)
		@data = data
		@hash,@nonce = compute_hash_with_proof_work
	end

	def compute_hash_with_proof_work ( difficulty = '00')
		nonce = 0

		loop do
			hash = Digest::SHA256.hexdigest("#{nonce}#{data}")

			if hash.start_with?(difficulty)
				return [hash,nonce]
			else
				nonce = nonce + 1
			end
		end

		
	end
		
end

pp Block.new("Hello, good")
pp Block.new("Hello, good")
puts Digest::SHA256.hexdigest("516Hello, good")
