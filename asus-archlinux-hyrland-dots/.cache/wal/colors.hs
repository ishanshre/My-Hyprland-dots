--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/ishan/Pictures/wallpapers/Lofi-Urban-Nightscape.png"

-- Special
background="#05870A"
foreground="#8fd4d3"
cursor="#8fd4d3"

-- Colors
color0="#05870A"
color1="#5D5752"
color2="#8AD072"
color3="#0A9B50"
color4="#156965"
color5="#2D6B69"
color6="#103D99"
color7="#8fd4d3"
color8="#649493"
color9="#5D5752"
color10="#8AD072"
color11="#0A9B50"
color12="#156965"
color13="#2D6B69"
color14="#103D99"
color15="#8fd4d3"