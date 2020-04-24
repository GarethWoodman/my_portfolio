require './lib/journey.rb'

class JourneyLog
  attr_reader :journeys, :current_journey

  def initialize
    @current_journey = Journey.new
    @journeys = []
  end

  def start(station)
    return false if @current_journey.in_journey?
    @current_journey = Journey.new
    @current_journey.entry = station
  end

  def finish(station)
    return false unless @current_journey.in_journey?
    @current_journey.exit = station
    add_journey if @current_journey.complete?
  end

  def last_journey
    @journeys.last
  end

  private
  def add_journey
    @journeys << @current_journey
    @current_journey = Journey.new
  end
end
