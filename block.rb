require 'digest'
require 'pry'

class Block
  attr_accessor :index, :timestamp, :hash

  def initialize(index:, timestamp:, data:, previous_hash:)
    @index = index
    @timestamp = timestamp
    @data = data
    @previous_hash = previous_hash
    @hash = generate_hash
  end

  def generate_hash 
    sha256 = Digest::SHA256.hexdigest(
      [
        @index,
        @timestamp,
        @data,
        @previous_hash
      ]
      .map(&:to_s)
      .join
    )
  end
end
