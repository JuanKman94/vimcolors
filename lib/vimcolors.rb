# frozen_string_literal: true
require "json"

module VimColors
  @@cterm_colors = nil

  # Colors in RGB, Hex & HSL
  #
  # @see https://jonasjacek.github.io/colors/
  # @see https://github.com/jonasjacek/colors/blob/master/data.json
  # @return [Array<Hash>] Array of colors with metadata

  def self.cterm_colors
    @@cterm_colors ||= parse_cterm_colors
  end

  def self.find_by_cterm(cterm)
    @@cterm_colors.find { |o| o.original[:colorId] == cterm }
  end

  private

  def self.parse_cterm_colors
    parsed = []
    tmp = nil
    json = JSON.parse(File.open(self.colors_path).read, symbolize_names: true)

    json.each do |o|
      tmp = TermColor.new(**{ cterm: o[:colorId] }.merge(o[:rgb]))
      tmp.original = o
      parsed << tmp
    end

    parsed
  end

  def self.colors_path
    "#{ File.dirname __FILE__ }/vimcolors/data/colors.json"
  end
end

require_relative "vimcolors/color"
require_relative "vimcolors/term_color"
require_relative "vimcolors/hex_color"
