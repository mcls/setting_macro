RSpec.describe SettingMacro do
  class Heating
    extend SettingMacro
    setting :default_temperature
    setting :heat_source, default: 'unknown'
  end

  class Oven < Heating
    default_temperature 200
  end

  class Sun < Heating
    default_temperature 5505
    heat_source 'nuclear_fusion'
  end

  it "works as expected" do
    expect(Heating.default_temperature).to eq(nil)
    expect(Oven.default_temperature).to eq(200)
    expect(Sun.default_temperature).to eq(5505)

    expect(Heating.heat_source).to eq('unknown')
    expect(Oven.heat_source).to eq('unknown')
    expect(Sun.heat_source).to eq('nuclear_fusion')
  end
end
