# frozen_string_literal: true

module VoyageAI
  # The usage returned by the VoyageAI API.
  #
  # @example
  #   VoyageAI::Usage.new(total_tokens: 0)
  class Usage
    # @!attribute [rw] total_tokens
    #   @return [Integer]
    attr_accessor :total_tokens

    # @param total_tokens [Integer]
    def initialize(total_tokens:)
      @total_tokens = total_tokens
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} total_tokens=#{total_tokens}>"
    end

    # @param data [Hash]
    # @return [Usage]
    def self.parse(data:)
      new(total_tokens: data["total_tokens"])
    end
  end
end
