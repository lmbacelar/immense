require 'rails_helper'

RSpec.describe "instruments/show", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      :reference => "Reference",
      :designation => "Designation",
      :brand => "Brand",
      :model => "Model",
      :part_number => "Part Number",
      :serial_number => "Serial Number",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Designation/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Part Number/)
    expect(rendered).to match(/Serial Number/)
    expect(rendered).to match(/MyText/)
  end
end
