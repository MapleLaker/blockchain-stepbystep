require 'digest'
require 'pp'

pp Time.utc(2009,1,3,18,15,5).to_i
pp Time.at(1231006505).utc

pp Time.utc(2009,1,9,2,54,25).to_i
pp Time.at(1231469665).utc

def int4 (num)
	[num].pack('V')
end

def hex32 (hex)
	[hex].pack('H*').reverse
end

def bin_to_hex ( bytes)
	bytes.unpack('H*')[0]
end

def bin_to_hex32( bytes )
	bytes.reverse.unpack('H*')[0]
end

def sha256( bytes)
	return Digest::SHA256.digest( bytes )
end

verion = 1
prev 		= '0000000000000000000000000000000000000000000000000000000000000000'
merkleroot 	= '4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b'
nonce = 2083236893
time = 1231006505
bits = 0x1d00ffff

header = int4(verion) + hex32(prev) + hex32(merkleroot)+ int4(time) + int4(bits) + int4(nonce) 

pp header.size
pp header
pp bin_to_hex(header)

pp s1 = sha256(header)
pp s2 = sha256(s1)
pp bin_to_hex32(s2)

verion = 1
prev 		= '000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f'
merkleroot 	= '0e3e2357e806b6cdb1f70b54c3a3a17b6714ee1f0e68bebb44a74b1efd512098'
nonce = 2573394689
time = 1231469665
bits = 0x1d00ffff

header = int4(verion) + hex32(prev) + hex32(merkleroot)+ int4(time) + int4(bits) + int4(nonce) 

pp header.size
pp header
pp bin_to_hex(header)

pp s1 = sha256(header)
pp s2 = sha256(s1)
pp bin_to_hex32(s2)


=begin
pp 1
pp int4(1)
pp bin_to_hex32(int4(1))
pp hex32('00000000000008a3a41b85b8b29ad444def299fee21793cd8b9e567eab02cd81')
merkleroot = '4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b'
pp hex32(merkleroot)
pp bin_to_hex32(hex32(merkleroot))
=end
