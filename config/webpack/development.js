process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");
const webpack = require("webpack");
const merge = require("webpack-merge");

// Replace
// module.exports = environment.toWebpackConfig()

const clientConfig = environment.toWebpackConfig();

const serverConfig = merge(environment.toWebpackConfig(), {
  target: "web",

  // There can only be one server-bundle
  entry: "./app/javascript/bundles/server-bundle.js",
  output: {
    filename: "hello-world-bundle-server.js",
    // https://webpack.js.org/configuration/output/#outputglobalobject
    globalObject: "this",
  },
});

serverConfig.plugins = serverConfig.plugins.filter(
  (plugin) => plugin.constructor.name !== "WebpackAssetsManifest"
);

serverConfig.plugins.push(
  new webpack.optimize.LimitChunkCountPlugin({
    maxChunks: 1,
  })
);

// For HMR, we need to separate the the client and server webpack configurations
if (process.env.WEBPACK_DEV_SERVER) {
  module.exports = clientConfig;
} else if (process.env.SERVER_BUNDLE_ONLY) {
  module.exports = serverConfig;
} else {
  module.exports = [clientConfig, serverConfig];
}
