local wezterm = require 'wezterm'

-- exported module table
local module = {}

-- private function to this module
local function private_helper()
  wezterm.log_error 'error!'
end


-- define functon in module table
-- only functions defined in `module` will export to code
-- that imports this module.
-- convention for making modules that update config
-- is for them to export an `apply_to_config` function
-- that accepts the config object
function module.apply_to_config(config)
  private_helper()
--  config.color_scheme = 'rose-pine-moon'
  config.color_scheme = 'Rosé Pine (Gogh)'
end

--return module table
return module
