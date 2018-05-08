# blockchain-stepbystep
1. 1-hash: 介绍了SHA256的hash算法。任意长度的内容，最后被转换成256个字节hash字符串。
2. 2-block-basic-structure: 介绍了单一Block的基本元素，data作为block记录的内容。hash用来存储 data 的hash结果。
3. 3-block_work_proof: 为单一Block引入了POW。data作为block记录的内容。nonce作为POW的内容。Difficulty作为动态调整难度。
4. 4-block_chain_hacker: 为单一Block引入了prev，将block链接成为chain. Chain解决的问题是，确保block中的data 不被修改5-blockchain             
5. 5-blockchain: 为单一Block引入了时间戳，难度值，去除了hash的元素。同时引入了hash()去实时重新计算hash(data),解决了4中hacker的风险。
6. 6-mining.rb: 通过动态调整difficuty，查看挖矿的时间和Hash Rate的计算方式。
7, 7-bitcoin.rb: 模拟了比特币的数据结构，通过比特币区块链上的数据，去validate block是否有效。
