# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stampede_app_session',
  :secret      => '1670830c5eeaae676c4f960bb6af34fcdc7232d24e675735df6f53f3cfa15fbdbb593886dff69b2ee4ef1fc08106b6d491ebf0f7b4d56634741980b713428276'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
