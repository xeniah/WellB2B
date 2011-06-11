class Challenge < ActiveRecord::Base
  attr_accessible :user_from_id, :user_to_id, :challenge_txt, :challenge_tm, :send_dt, :accepted, :accepted_dt, :due_dt, :complete_dt
end
