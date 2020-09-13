# frozen_string_literal: true
require "json"

module VimColors
  class TermColor < Color

    SIMILARITY_THRESHOLD = 15

    # Initialize new term color
    #
    # @param [Integer] r
    # @param [Integer] g
    # @param [Integer] b

    def initialize(r: 0, g: 0, b: 0, cterm: nil)
      @r = r
      @g = g
      @b = b
      @cterm = cterm
    end

    # Check if it's similar to other color
    #
    # @param [VimColors::Color] other
    # @return [Boolean]

    def is_similar?(other, thresh = SIMILARITY_THRESHOLD)
      similar = true
      [ :r, :g, :b ].each do |c|
        similar = false if (self.send(c) - other.send(c)).abs > thresh
      end
      similar
    end

    def to_hex
      HexColor.new(**{ r: int2hex(r), g: int2hex(g), b: int2hex(b) })
    end

    def to_s
      "rgb(#{ r }, #{ g }, #{ b })"
    end
  end
end
