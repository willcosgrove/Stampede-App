class Notifier < ActionMailer::Base
  def welcome_letter(stampeder)
    recipients  stampeder.email
    from        "registration@stampede10.com"
    subject     "Can't wait to see ya at Stampede!"
    body        :stampeder => stampeder
  end
  
  def information_letter(stampeder)
    recipients  stampeder.parentemail
    from        "registration@stampede10.com"
    subject     "#{stampeder.firstname} has signed up for Stampede"
    body        :stampeder => stampeder
  end
end
