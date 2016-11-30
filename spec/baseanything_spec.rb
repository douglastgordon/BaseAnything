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
    expect(base_two_sys.to_quaternary("0")).to eq("0")
    expect(base_two_sys.to_quaternary("1")).to eq("1")
    expect(base_two_sys.to_quaternary("100")).to eq("10")
    expect(base_two_sys.to_quaternary("1011")).to eq("23")
  end

  it "converts base2 to base7" do
    expect(base_two_sys.to_heptary("10011")).to eq("25")
    expect(base_two_sys.to_heptary("1110")).to eq("20")
    expect(base_two_sys.to_heptary("11101")).to eq("41")
    expect(base_two_sys.to_heptary("01011")).to eq("14")
  end

  it "converts base2 to base11" do
    expect(base_two_sys.to_undecimal("10011")).to eq("18")
    expect(base_two_sys.to_undecimal("1110")).to eq("13")
    expect(base_two_sys.to_undecimal("11101")).to eq("27")
    expect(base_two_sys.to_undecimal("01011")).to eq("10")
  end

  it "converts base4 to base2" do
    expect(base_four_sys.to_binary("10011")).to eq("100000101")
    expect(base_four_sys.to_binary("32120")).to eq("1110011000")
    expect(base_four_sys.to_binary("112")).to eq("10110")
    expect(base_four_sys.to_binary("1312")).to eq("1110110")
  end

  it "converts base4 to base7" do
    expect(base_four_sys.to_heptary("10011")).to eq("522")
    expect(base_four_sys.to_heptary("32120")).to eq("2453")
    expect(base_four_sys.to_heptary("112")).to eq("31")
    expect(base_four_sys.to_heptary("1312")).to eq("226")
  end

  it "converts base4 to base11" do
    expect(base_four_sys.to_undecimal("10011")).to eq("218")
    expect(base_four_sys.to_undecimal("32120")).to eq("767")
    expect(base_four_sys.to_undecimal("112")).to eq("20")
    expect(base_four_sys.to_undecimal("1312")).to eq("A8")
  end

  it "converts base7 to base2" do
    expect(base_seven_sys.to_binary("6433")).to eq("100011100110")
    expect(base_seven_sys.to_binary("203201")).to eq("1000011110110110")
    expect(base_seven_sys.to_binary("5510")).to eq("11110101111")
    expect(base_seven_sys.to_binary("5")).to eq("101")
  end

  it "converts base7 to base4" do
    expect(base_seven_sys.to_quaternary("6433")).to eq("203212")
    expect(base_seven_sys.to_quaternary("203201")).to eq("20132312")
    expect(base_seven_sys.to_quaternary("5510")).to eq("132233")
    expect(base_seven_sys.to_quaternary("5")).to eq("11")
  end

  it "converts base7 to base11" do
    expect(base_seven_sys.to_undecimal("6433")).to eq("1791")
    expect(base_seven_sys.to_undecimal("203201")).to eq("24114")
    expect(base_seven_sys.to_undecimal("5510")).to eq("1529")
    expect(base_seven_sys.to_undecimal("5")).to eq("5")
  end

  it "converts base11 to base2" do
    expect(base_eleven_sys.to_binary("9A812")).to eq("100011101010001100")
    expect(base_eleven_sys.to_binary("937566")).to eq("101101111000010010000")
    expect(base_eleven_sys.to_binary("A31")).to eq("10011011100")
    expect(base_eleven_sys.to_binary("5")).to eq("101")
  end

  it "converts base11 to base4" do
    expect(base_eleven_sys.to_quaternary("9A812")).to eq("203222030")
    expect(base_eleven_sys.to_quaternary("937566")).to eq("11233002100")
    expect(base_eleven_sys.to_quaternary("A31")).to eq("103130")
    expect(base_eleven_sys.to_quaternary("5")).to eq("11")
  end

  it "converts base11 to base7" do
    expect(base_eleven_sys.to_heptary("9A812")).to eq("1145555")
    expect(base_eleven_sys.to_heptary("937566")).to eq("15531010")
    expect(base_eleven_sys.to_heptary("A31")).to eq("3425")
    expect(base_eleven_sys.to_heptary("5")).to eq("5")
  end

end
