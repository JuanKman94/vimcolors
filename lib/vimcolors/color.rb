# frozen_string_literal: true

module VimColors
  class Color
    attr_accessor :r, :g, :b, :cterm, :original

    private

    def int2hex(n)
      n.to_s(16)
    end

    def hex2int(hex)
      dec = 0
      hex.sub('#', '').reverse.downcase.split('').each_with_index do |h, i|
        dec = dec + (VimColors::HexColor::HEX[h] * (16**i))
      end
      dec
    end
  end
end
