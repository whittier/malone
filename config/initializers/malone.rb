# Amazon Web Services Configuration

# Config for email
Malone::Application.config.oc_malone_host         = ENV['MAIL_HOST']
Malone::Application.config.oc_malone_address      = ENV['MAIL_ADDRESS']
Malone::Application.config.oc_malone_sender_email = ENV['SENDER_EMAIL']
Malone::Application.config.oc_malone_admin_address = ENV['ADMIN_ADDRESS']
