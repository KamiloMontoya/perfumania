class Backend::SessionsController < Devise::SessionsController
  layout "backend"
  # the rest is inherited, so it should work
end