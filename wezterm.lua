local wezterm = require 'wezterm';

local color_scheme_pool = { 'Andromeda', 'Argonaut', 'Arthur', 'Aurora', 'Belafonte Night', 'BirdsOfParadise', 'BlulocoDark', 'Chester', 'Ciapre', 'Cobalt2', 'Darkside', 'Desert', 'DimmedMonokai', 'Doom Peacock', 'DoomOne', 'DotGov', 'Earthsong', 'Elemental', 'Elementary', 'Espresso Libre', 'Espresso', 'Fahrenheit', 'Fideloper', 'Firewatch', 'ForestBlue', 'FunForrest', 'Galaxy', 'Galizur', 'GitHub Dark', 'Glacier', 'Grape', 'Gruvbox Dark', 'Guezwhoz', 'Hacktober', 'Highway', 'Hivacruz', 'Hopscotch.256', 'Hybrid', 'IC_Green_PPL', 'IC_Orange_PPL', 'Jellybeans', 'JetBrains Darcula', 'Kibble', 'Kolorit', 'Konsolas', 'Laser', 'Later This Evening', 'LiquidCarbon', 'LiquidCarbonTransparent', 'Mariana', 'MaterialDark', 'MaterialDarker', 'MaterialOcean', 'Mathias', 'Medallion', 'Mirage', 'Misterioso', 'Molokai', 'MonaLisa', 'Monokai Soda', 'Monokai Vivid', 'MonokaiRemastered', 'N0tch2k', 'Neutron', 'NightLion v2', 'Nocturnal Winter', 'Obsidian', 'OceanicMaterial', 'Ollie', 'OneHalfDark', 'Operator Mono Dark', 'Overnight Slumber', 'PaleNightHC', 'Pandora', 'Paraiso Dark', 'PaulMillr', 'PencilDark', 'Pnevma', 'Popping and Locking', 'Rapture', 'Raycast_Dark', 'Red Planet', 'Relaxed', 'Rouge 2', 'Ryuuko', 'SeaShells', 'Seafoam Pastel', 'Seti', 'Shaman', 'Slate', 'SleepyHollow', 'Smyck', 'Snazzy', 'SoftServer', 'Solarized Dark Higher Contrast', 'SpaceGray Eighties Dull', 'SpaceGray Eighties', 'Spacedust', 'Subliminal', 'Thayer Bright', 'Tinacious Design (Dark)', 'Tomorrow Night Burns', 'Tomorrow Night Eighties', 'Tomorrow Night', 'Treehouse', 'Twilight', 'Ubuntu', 'Violet Dark', 'WildCherry', 'ayu', 'cyberpunk', 'deep', 'iceberg-dark', 'idea', 'idleToes', 'jubi', 'lovelace', 'matrix', 'midnight-in-mojave', 'nord', 'synthwave', 'synthwave-everything' }

math.randomseed( os.time() )
local color_scheme_index = math.random(#(color_scheme_pool))
local color_scheme = color_scheme_pool[color_scheme_index]

-- wezterm.on("window-config-reloaded", function(window, pane)
  -- window:toast_notification("wezterm", "configuration reloaded: " .. color_scheme, nil, 1000)
-- end)

wezterm.on("window-config-reloaded", function(window, pane)
  -- local date = wezterm.strftime("%Y-%m-%d %H:%M:%S");

  -- Make it italic and underlined
  window:set_right_status(wezterm.format({
    -- {Attribute={Italic=true}},
    {Attribute={Intensity="Half"}},
    -- {Text=date.." | "..window:effective_config().color_scheme},
    {Text=window:effective_config().color_scheme},
  }));
end);

return {
  color_scheme = color_scheme,
  font = wezterm.font_with_fallback({ "Dank Mono", "RobotoMono Nerd Font Mono"}),
  font_size = 13,
  initial_rows = 40,
  initial_cols = 105
}

