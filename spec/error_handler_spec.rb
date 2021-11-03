require './src/error_handler'

RSpec.describe ErrorHanlder do
  describe '#check_value' do
    context 'правильное значение' do
      subject { ErrorHanlder.new.check_value(5.5) }
      it { is_expected.to eq true }
    end

    context 'неверное значение' do
      subject { ErrorHanlder.new.check_value('test') }
      it { is_expected.to eq false }
    end
  end

  describe '#check_correct_scale' do
    context 'правильная система измерения температуры' do
      subject { ErrorHanlder.new.check_correct_scale('F') }
      it { is_expected.to eq true }
    end

    context 'не правильная система измерения температуры' do
      subject { ErrorHanlder.new.check_correct_scale('test') }
      it { is_expected.to eq false }
    end
  end

  describe '#check_repeating_scale' do
    context 'не повторяющаяся система измерения температуры' do
      subject { ErrorHanlder.new.check_repeating_scale('F', 'C') }
      it { is_expected.to eq true }
    end

    context 'повторяющаяся система измерения температуры' do
      subject { ErrorHanlder.new.check_repeating_scale('F', 'F') }
      it { is_expected.to eq false }
    end
  end
end
