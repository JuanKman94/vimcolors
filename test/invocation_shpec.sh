#!/bin/sh

#PROJECT_DIR="$( realpath "$(dirname "$(realpath $1)")/..")"
SUBJECT="$PWD/bin/vimcolors"

GREEN_RGB_HEXSTRING="#00ff00"
GREEN_HEX="#00ff00"
KINDA_GREEN_HEX="#00ee00"

# Generate GREP for hex color
#
# @param  [String] hex color
# @return [String] Regular expression for hex string

function enclose_hex() {
    STR_START='"hexString":\s*"'
    STR_END='"'
    echo "$STR_START$1$STR_END"
}

describe "invocation"
    it "handles several hex arguments"
        shpec $SUBJECT "$GREEN_HEX" "$KINDA_GREEN_HEX" > /dev/null 2>&1
        assert equal "$?" "0"
    end

    it "handles piped arguments"
        echo -e "$GREEN_HEX\n$KINDA_GREEN_HEX" | \
            shpec $SUBJECT > /dev/null 2>&1
        assert equal "$?" "0"
    end
end

describe "hex => rgb"
    it "finds exact conversion"
        output="$($SUBJECT "$GREEN_HEX")"
        assert grep "$output" "$(enclose_hex $GREEN_RGB_HEXSTRING)"
    end

    it "finds approximate color"
        output="$($SUBJECT "$KINDA_GREEN_HEX")"
        assert grep "$output" "$(enclose_hex $GREEN_HEX)"
    end
end
