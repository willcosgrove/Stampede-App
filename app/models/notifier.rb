class Notifier < ActionMailer::Base
  def welcome_letter(stampeder)
    recipients  stampeder.email
    from        "no-reply@stampede10.com"
    subject     "Can't wait to see ya at Stampede!"
    body        :stampeder => stampeder
  end
  
  def information_letter(stampeder)
    recipients  stampeder.parentemail
    from        "no-reply@stampede10.com"
    subject     "Your #{return "son" if stampeder.gender == 0} #{return "daughter" if stampeder.gender == 1} has signed up for Stampede"
    body        :stampeder => stampeder
  end
end
