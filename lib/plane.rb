class Plane
  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
    fail 'This plane is not in the air!' if self.status != "flying"
    fail 'This airport is full.' if airport.full?
    fail 'The weather is too stormy for landing right now.' if airport.stormy?
    airport.planes << self
    @status = "landed at #{airport}"
  end

  def take_off(airport)
    fail 'This plane is not at that airport!' if !airport.planes.include?(self)
    fail 'The weather is too stormy for take off right now.' if airport.stormy?
    airport.planes.delete(self)
    @status = "flying"
  end

end
