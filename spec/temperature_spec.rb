require './src/temperature'

RSpec.describe Temperature do
  describe '#converter' do
    context 'Из С ковентирую F' do
      subject { Temperature.new('C', 'F', 30).converter }
      it { is_expected.to eq 86 }
    end

    context 'Из F конвертирую C' do
      subject { Temperature.new('F', 'C', 12).converter }
      it { is_expected.to eq(-11.2) }
    end

    context 'Из F конвентирую в K' do
      subject { Temperature.new('F', 'K', 46).converter }
      it { is_expected.to eq 280.99 }
    end

    context 'Из С ковентирую в К' do
      subject { Temperature.new('C', 'K', 15).converter }
      it { is_expected.to eq 288.15 }
    end

    context 'Из К конвентирую в F' do
      subject { Temperature.new('K', 'F', 10).converter }
      it { is_expected.to eq(-441.67) }
    end
  end
end
