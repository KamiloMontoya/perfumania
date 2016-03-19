class Backend::RegistrationsController < Devise::RegistrationsController
  layout "backend"
  # the rest is inherited, so it should work
end