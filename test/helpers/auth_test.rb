# frozen_string_literal: true

class AppointmentTest < ActiveSupport::TestCase
  test 'Auth encode and decodes' do
    payload = { username: 'lushhy' }
    token = Auth.issue(payload)
    assert_not_nil(token)
    assert_equal(Auth.decode(token)['username'], payload[:username])
  end
end
