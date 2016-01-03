require 'rails_helper'

RSpec.describe "instruments/index", type: :view do
  before(:each) do
    assign(:instruments, [
      Instrument.create!(
        :reference => "Reference",
        :designation => "Designation",
        :brand => "Brand",
        :model => "Model",
        :part_number => "Part Number",
        :serial_number => "Serial Number",
        :notes => "MyText"
      ),
      Instrument.create!(
        :reference => "Reference",
        :designation => "Designation",
        :brand => "Brand",
        :model => "Model",
        :part_number => "Part Number",
        :serial_number => "Serial Number",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of instruments" do
    render
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Designation".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Part Number".to_s, :count => 2
    assert_select "tr>td", :text => "Serial Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
