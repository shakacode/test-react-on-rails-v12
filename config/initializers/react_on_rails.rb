# frozen_string_literal: true

# See https://github.com/shakacode/react_on_rails/blob/master/docs/basics/configuration.md
# for many more options.

ReactOnRails.configure do |config|
  # This configures the script to run to build the production assets by webpack. Set this to nil
  # if you don't want react_on_rails building this file for you.
  config.build_production_command = "RAILS_ENV=production NODE_ENV=production bin/webpack"

  ################################################################################
  ################################################################################
  # TEST CONFIGURATION OPTIONS
  # Below options are used with the use of this test helper:
  # ReactOnRails::TestHelper.configure_rspec_to_compile_assets(config)
  ################################################################################

  # If you are using this in your spec_helper.rb (or rails_helper.rb):
  #
  # ReactOnRails::TestHelper.configure_rspec_to_compile_assets(config)
  #
  # with rspec then this controls what yarn command is run
  # to automatically refresh your webpack assets on every test run.
  #
  config.build_test_command = "RAILS_ENV=test bin/webpack"

  ################################################################################
  ################################################################################
  # SERVER RENDERING OPTIONS
  ################################################################################
  # This is the file used for server rendering of React when using `(prerender: true)`
  # If you are never using server rendering, you should set this to "".
  # Note, there is only one server bundle, unlike JavaScript where you want to minimize the size
  # of the JS sent to the client. For the server rendering, React on Rails creates a pool of
  # JavaScript execution instances which should handle any component requested.
  #
  # While you may configure this to be the same as your client bundle file, this file is typically
  # different. You should have ONE server bundle which can create all of your server rendered
  # React components.
  #
  config.server_bundle_js_file = "server-bundle.js"

  # This value only affects server-side rendering when using the webpack-dev-server
  # If you are hashing the server bundle and you want to use the same bundle for client and server,
  # you'd set this to `true` so that React on Rails reads the server bundle from the webpack-dev-server.
  # Normally, you have different bundles for client and server, thus, the default is false.
  # Furthermore, if you are not hashing the server bundle (not in the manifest.json), then React on Rails
  # will only look for the server bundle to be created in the typical file location, typically by
  # a `webpack --watch` process.
  config.same_bundle_for_client_and_server = false
end
