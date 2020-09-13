# frozen_string_literal: true

module VimColors
  class HexColor < Color

    HEX = {
      "0" => 0,
      "1" => 1,
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "a" => 10,
      "b" => 11,
      "c" => 12,
      "d" => 13,
      "e" => 14,
      "f" => 15,
    }

    # Initialize new hex color
    #
    # @param [String]  s String representation of hex number
    # @param [Integer] r
    # @param [Integer] g
    # @param [Integer] b

    def initialize(s = nil, r: 0, g: 0, b: 0)
      if s
        _s = s.sub("#", "")
        raise ArgumentError if _s.length != 6
        @r = _s[0..1]
        @g = _s[2..3]
        @b = _s[4..5]
      else
        @r = r
        @g = g
        @b = b
      end
    end

    # Red, green, blue color components getters.
    #
    # It's written this way solely to DRY the "0" validation

    [ :r, :g, :b ].each do |c|
      class_eval <<EOF
  def #{c}
    if @#{c} == "0" then "00"
    else @#{c}; end
  end
EOF
    end

    def to_rgb
      TermColor.new(**{ r: hex2int(r), g: hex2int(g), b: hex2int(b) })
    end

    def to_s
      "##{ r }#{ g }#{ b }"
    end
  end
end
