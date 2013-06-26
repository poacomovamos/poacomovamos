class Session < ActiveRecord::Base
  
  validates :number, :presence => true
  validates :session_type, :presence => true
  validates :date, :presence => true
  
  attr_accessible :number, :session_type, :date
  
  def as_json(options = {})
    super(only: [:number, :session_type, :date])
  end
  
end
