class Temperature
  def initialize(source_scale, target_scale, value)
    @source_scale = source_scale
    @target_scale = target_scale
    @value = value
  end

  def converter
    scale_map = {
      'C' => {
        'F' => ->(x) { (1.8 * x) + 32 },
        'K' => ->(x) { x + 273.15 },
        'R' => ->(x) { x * 0.8 }
      },
      'F' => {
        'C' => ->(x) { 0.56 * (x - 32) },
        'K' => ->(x) { (0.56 * (x - 32)) + 273.15 },
        'R' => ->(x) { (0.45 * (x - 32)) }
      },
      'K' => {
        'C' => ->(x) { x - 273.15 },
        'F' => ->(x) { ((x - 273.15) * 1.8) + 32 },
        'R' => ->(x) { ((x - 273.15) * 0.8) }
      },
      'R' => {
        'C' => ->(x) { x * 1.25 },
        'F' => ->(x) { (x * 2.25) + 32 },
        'K' => ->(x) { (x * 1.25) + 273.15 }
      }
    }
    scale_map[@source_scale][@target_scale].call(@value).round(3)
  end
end
