class ApplicationMailer < ActionMailer::Base
  default from: ENV["dev_email"]
  
  layout 'mailer'

end
