require 'digest'
require 'pp'

class Block
	attr_reader :data
	attr_reader :hash

	def initialize(data)
		@data = data
		@hash = Digest::SHA256.hexdigest(data)
	end
		
end

pp Block.new("Hello, Cryptos!")
