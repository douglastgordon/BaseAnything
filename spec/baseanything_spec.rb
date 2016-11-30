require 'rspec'
require 'baseanything'

describe '#to_base' do
  base_two = ['0', '1']
  base_four = ['0', '1', '2', '3']
  base_seven = ['0', '1', '2', '3', '4', '5', '6']
  base_eleven = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A']
  let(:base_two_sys) { NumberSystem.new(base_two) }
  let(:base_four_sys) { NumberSystem.new(base_four) }
  let(:base_seven_sys) { NumberSystem.new(base_seven) }
  let(:base_eleven_sys) { NumberSystem.new(base_eleven) }

  it "converts base2 to base4" do
    expect(base_two_sys.to_quaternary("1011")).to eq("23")
  end

end
