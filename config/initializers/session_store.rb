# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_altruism_session',
  :secret      => '0d13a66164b086ccfe0907ebf34acc36b1178efe97a044962aee6efdc1147a83b5d178d22739890e69a05811ca9e3cc8cbf6adf770916b60306d9fde91f5c2b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
