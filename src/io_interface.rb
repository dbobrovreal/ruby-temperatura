require './src/error_handler'

class IOInterface
  def initialize
    @error_handler = ErrorHanlder.new
  end

  def input_source_scale
    puts 'Enter the source scale ("F", "C" or "K"):'
    source_scale = gets.chomp

    if @error_handler.check_correct_scale(source_scale)
      source_scale
    else
      input_source_scale
    end
  end

  def input_target_scale(source_scale)
    puts 'Enter the target scale:'
    target_scale = gets.chomp

    if  @error_handler.check_correct_scale(target_scale) &&
        @error_handler.check_repeating_scale(source_scale, target_scale)
      target_scale
    else
      input_target_scale(source_scale)
    end
  end

  def input_value
    puts 'Enter a value:'
    value = gets

    if @error_handler.check_value(value)
      value.to_f
    else
      input_value
    end
  end

  def output_result(result)
    puts "Result = #{result}"
  end

  def check_exit
    puts 'To exit, enter "stop" or "next" to continue'
    state = gets.chomp

    case state
    when 'stop'
      abort 'See you soon!'
    when 'next'
      true
    else
      check_exit
    end
  end
end