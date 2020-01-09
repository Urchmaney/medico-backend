ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def h_get(url, token)
    get url, headers: { 'Authorization': 'Bearer ' + token}, as: :json
  end

  def h_post(url, params, token)
    post url, params: params, headers: { 'Authorization': 'Bearer ' + token}, as: :json
  end

  def h_patch(url, params, token)
    patch url, params: params, headers: { 'Authorization': 'Bearer ' + token}, as: :json
  end

  def h_delete(url, token)
    delete url, headers: { 'Authorization': 'Bearer ' + token}, as: :json
  end
end
