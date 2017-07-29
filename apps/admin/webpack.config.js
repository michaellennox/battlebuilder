var webpack = require('webpack');
var path = require('path');

var appName = 'warscroll_manager.js';
var entryPoint = path.resolve(__dirname, './src/warscroll_manager.js');
var exportPath = path.resolve(__dirname, './build');

var plugins = [];
var env = process.env.WEBPACK_ENV;

if (env === 'production') {
  plugins.push(new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    }
  ));
};

module.exports = {
  entry: entryPoint,
  output: {
    path: exportPath,
    filename: appName
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js',
      '@': path.resolve(__dirname, './src')
    }
  },
  plugins
};
