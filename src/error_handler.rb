class ErrorHanlder
  def check_value(value)
    !Float(value).nil?
  rescue StandardError
    puts 'Введено неверное значение (целое число или число с плавающей запятой)'
    false
  end

  def check_correct_scale(scale)
    if %w[C F K].include? scale
      true
    else
      puts 'Была введена неправильная шкала ("F", "C" или "K")'
      false
    end
  end

  def check_repeating_scale(source_scale, target_scale)
    if source_scale == target_scale
      puts 'Введенные шкалы одинаковы'
      false
    else
      true
    end
  end
end
