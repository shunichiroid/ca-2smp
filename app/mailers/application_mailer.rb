class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("DEFAULT_MAIL")
  layout 'mailer'
end
