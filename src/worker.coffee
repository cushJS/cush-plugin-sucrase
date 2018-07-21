sucrase = require '@cush/sucrase'
log = require 'lodge'

processed = Symbol 'sucrase:processed'
sourceMapOptions = {}

module.exports = ->
  config = @get 'sucrase', {}

  process = (asset, config) =>
    config.filePath = @relative asset.path
    config.enableLegacyBabel5ModuleInterop = true
    config.sourceMapOptions = sourceMapOptions
    sucrase.transform asset.content, config

  isFlow = (pack) ->
    deps = pack.devDependencies
    Boolean deps and deps['flow-bin']

  @transform '.js', (asset, pack) ->
    if !asset[processed]
      transforms = ['imports']
      transforms.push 'flow' if isFlow pack
      process asset, {transforms}

  if config.exts
    @transform Object.keys(config.exts), (asset) ->
      asset[processed] = true
      result = process asset,
        transforms: ['imports'].concat config.exts[asset.ext]
        jsxPragma: config.jsxPragma
        jsxFragmentPragma: config.jsxFragmentPragma

      asset.ext = '.js'
      return result
