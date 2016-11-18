class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  attr_accessor :disable_confirmation_email

  private

  def disable_confirmation_email
    Devise::Mailer.confirmation_instructions unless disable_confirmation_email
  end
end
