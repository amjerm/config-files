local wezterm = require 'wezterm';

local color_scheme_pool = {
  'Aurora',
  'Fahrenheit',
  'Fideloper',
  'Firewatch',
  'IC_Orange_PPL',
  'MonaLisa',
  'SleepyHollow',
  'Spacedust',
  'Subliminal',
  'Tomorrow Night Burns',
  'ayu',
  'jubi',
  'SeaShells',
  'Seafoam Pastel',
  'Gruvbox Dark',
  'MaterialOcean',
  'Twilight',
  'ForestBlue',
  'Shaman',
  'nord',
  'Grape',
  'Tinacious Design (Dark)',
  'iceberg-dark',
  'matrix',
  'GitHub Dark',
  'JetBrains Darcula',
  'Thayer Bright',
  'BlulocoDark',
  'DoomOne',
  'Slate',
  'Tomorrow Night Eighties',
  'Tomorrow Night',
  'Earthsong',
  'Espresso Libre',
  'FunForrest',
}

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
    {Text=window:effective_config().color_scheme.."     "},
  }));
end);

return {
  color_scheme = color_scheme,
  font = wezterm.font_with_fallback({ "Dank Mono", "RobotoMono Nerd Font Mono"}),
  font_size = 16,
  initial_rows = 40,
  initial_cols = 105
}

