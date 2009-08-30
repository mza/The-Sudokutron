# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sudokutron_session',
  :secret      => 'c9af676a463617a0ee6b69e30c8d4cdfa837fdd24c27f667c078cdbbef94df94caecb07f12721f602c0b4287058c011876d221392bf11d11d61e220cb7763407'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
