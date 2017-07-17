# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'grand_alliances#index'

resources :grand_alliances, only: [:index]
resources :armies, only: [:index, :new, :create]
