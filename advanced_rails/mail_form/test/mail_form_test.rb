require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase
  # test 'sample mail has name and email attributes' do
  #   sample = SampleMail.new
  #   sample.name = 'User'
  #   assert_equal 'User', sample.name
  #   sample.email = 'user@example.com'
  #   assert_equal 'user@example.com', sample.email
  # end

  test 'Play around with self.attributes method' do
    sample = SampleMail.new
    sample.class.attributes(:email, :name)
    assert_equal true, (sample.respond_to? :email)
    assert_equal true, (sample.respond_to? :email=)
  end

  test 'sample mail can clear attributes using clear_fix' do
    sample = SampleMail.new
    sample.name = 'User'
    sample.email = 'user@example.com'
    assert_equal 'User', sample.name
    assert_equal 'user@example.com', sample.email

    sample.clear_name
    sample.clear_email
    assert_nil sample.name
    assert_nil sample.email
  end

  test 'sample mail can ask if an attribute is present or not' do
    sample = SampleMail.new
    assert !sample.name?

    sample.name = 'User'
    assert sample.name?

    sample.email = ''
    assert !sample.email?
  end
end
