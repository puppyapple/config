local hlargs = require("hlargs")
hlargs.setup {
  color = '#e5c07b',
  -- use_colorpalette = true,
  paint_arg_declarations = false,
  extras = { named_parameters = false },
  excluded_argnames = { usages = { python = { 'self', 'cls' } } }
}
