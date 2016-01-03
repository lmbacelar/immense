require 'rails_helper'

RSpec.describe "instruments/new", type: :view do
  before(:each) do
    assign(:instrument, Instrument.new(
      :reference => "MyString",
      :designation => "MyString",
      :brand => "MyString",
      :model => "MyString",
      :part_number => "MyString",
      :serial_number => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders new instrument form" do
    render

    assert_select "form[action=?][method=?]", instruments_path, "post" do

      assert_select "input#instrument_reference[name=?]", "instrument[reference]"

      assert_select "input#instrument_designation[name=?]", "instrument[designation]"

      assert_select "input#instrument_brand[name=?]", "instrument[brand]"

      assert_select "input#instrument_model[name=?]", "instrument[model]"

      assert_select "input#instrument_part_number[name=?]", "instrument[part_number]"

      assert_select "input#instrument_serial_number[name=?]", "instrument[serial_number]"

      assert_select "textarea#instrument_notes[name=?]", "instrument[notes]"
    end
  end
end
