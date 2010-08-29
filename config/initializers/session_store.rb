# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_libsukes_session',
  :secret      => 'fc5f87358e3abf8ed411a3d9611ff646ad50772b2a43b569612fffae70d9e236fb9e3aa33ec12ad7bc17cdfc4cb68f164708ac97ce3b62f07e10279fff263f00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
