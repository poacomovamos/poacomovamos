class RunningProject < ActiveRecord::Base
  validates_presence_of :number, :year, :type, :materia, :ementa, 
    :processing_date, :sector, :authors

  validates_uniqueness_of :number
end
