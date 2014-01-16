# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
Herokuapp::Application.config.secret_key_base = secure_token
#Herokuapp::Application.config.secret_key_base = '980716de40a376d40f37a11a0dab195c291bd162b749dd9695460c56828066ac9d8eb1f384d9f9692229a2510be9370f202b9a751f827b6019a7e4b52ddb050c'
