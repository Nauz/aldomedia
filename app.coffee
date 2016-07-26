netlify         = require 'roots-netlify'
axis            = require 'axis'
rupture         = require 'rupture'
autoprefixer    = require 'autoprefixer-stylus'
js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
accord          = require 'accord'
postcss         = accord.load 'postcss'
rucksack        = require 'rucksack-css'
lost            = require 'lost'
font_magician   = require 'postcss-font-magician'
typographic     = require 'typographic'
postcss_nested  = require 'postcss-nested'
postcss_nesting  = require 'postcss-nesting'
postcss_modules = require 'postcss-modules'
postcss_initial = require 'postcss-initial'
postcss_autoreset = require 'postcss-autoreset'
cssnano           = require 'cssnano' 


module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '_**/*', '.gitignore', 'ship.*conf', '.npmrc', 'views/*.sublime-project']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [axis(), rupture(), typographic()]
    sourcemap: true
    'import css': true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  postcss:
    use: [
      lost(),
      font_magician({
        hosted: 'assets/fonts'
        }),
      postcss_nested(),
      postcss_nesting(),
      # rucksack(),
      # postcss_autoreset({
      #   # reset: 'initial',
      #   # rulesMatcher: 'bem'
      #   }),
      postcss_initial({
        reset: 'inherited'
        })
      # cssnano({
      #   core: false
      #   })
    ]