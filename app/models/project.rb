class Project < ActiveRecord::Base
  attr_accessible :process_number, :year, :type, :number, :description,
    :processing_date, :sector, :authors, :status, :veto

  validates_presence_of :process_number, :year, :type, :number, :description,
    :processing_date, :sector, :authors, :status

  validates_uniqueness_of :process_number
end
