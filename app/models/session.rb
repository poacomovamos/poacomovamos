class Session < ActiveRecord::Base
  attr_accessor :number, :type, :date

  def initialize(opts)
    @date = opts[:date]
    @type = opts[:type]
    @number = opts[:number]
  end
end
