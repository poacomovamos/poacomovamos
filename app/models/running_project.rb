class RunningProject < ActiveRecord::Base
  attr_accessible :number, :year, :type, :materia, :ementa,
    :processing_date, :sector, :authors, :status, :veto

  validates_presence_of :number, :year, :type, :materia, :ementa, 
    :processing_date, :sector, :authors, :status

  validates_uniqueness_of :number
end
