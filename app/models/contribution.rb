class Contribution < ActiveRecord::Base

  # Store a band mates code
  # contribution to a stage.
  # Can be modified via sending
  # messages to the stage.

  belongs_to :user
  belongs_to :stage

end
