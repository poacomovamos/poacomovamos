class Session < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  attr_accessor :number, :type, :date

  validates :number, :presence => true
  validates :type, :presence => true
  validates :date, :presence => true
  
  attr_accessible :number, :type, :date
end
