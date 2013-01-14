class Payment
  attr_reader :value

  def initialize(params)
    @value = params['value']
  end

  def perform
    p value * 100
  end
end
