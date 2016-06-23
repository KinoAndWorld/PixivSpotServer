require 'grape'
require 'grape-swagger'
require_relative './features'
require_relative './artworks'

module API
  class Root < Grape::API
    version 'v1', using: :header, vendor: 'feature-collection' # this can be path, vendor header, accept-version header, or param
    format :json
    prefix :api

    mount API::Features
    mount API::Artworks

    add_swagger_documentation(
        mount_path: 'swagger_doc',
        hide_format: true,
        hide_documentation_path: true
      )
  end
end
