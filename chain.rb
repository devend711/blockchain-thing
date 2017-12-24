require_relative 'block'
require 'date'

class Chain
  def initialize
    @block_array = [create_genesis_block]
  end

  def chain
    return @block_array
  end
  
  def create_genesis_block
    return Block.new(
      index: 0,
      timestamp: DateTime.now,
      data: {},
      previous_hash: "0"
    )
  end

  def create_next_block(data:, previous_block:)
    block = Block.new(
      index: previous_block.index + 1,
      timestamp: DateTime.now,
      data: data,
      previous_hash: previous_block.hash
    )

    puts "Adding block #{block.index} to the chain"
    puts "Hash: #{block.hash}"

    return block
  end
end
