const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
      Popper: 'popper.js/dist/popper'
  })
)
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'admin-lte/plugins/jquery/jquery',
    jQuery: 'admin-lte/plugins/jquery/jquery',
  })
)

environment.toWebpackConfig().merge({
  resolve: {
  alias: {
    'jquery': 'admin-lte/plugins/jquery/jquery',
    }
  }
});

module.exports = environment
