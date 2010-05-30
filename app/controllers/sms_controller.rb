class SmsController < ApplicationController
  protect_from_forgery :only => [:delete]
  def create
    sms = params["Body"]
    breakdown = sms.split(' ')
    class_call = breakdown[0]
    breakdown.delete_at(0)
    method_call = breakdown.join('_')  
    case class_call.capitalize
    when "Stampeder"
      run = "Stampeder." + method_call
      reply = eval run unless run == "delete_all"
    when "Team"
      run = "Team." + method_call
      reply = eval run unless run == "delete_all"
    end
    if run == "delete_all"
      reply = "Hey, you can't do that!"
    end
    verb = Twilio::Verb.new do |v|
      v.sms reply.to_s
    end
    render :xml => verb.response
  end
end
