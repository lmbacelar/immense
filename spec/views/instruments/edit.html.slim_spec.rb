require 'rails_helper'

RSpec.describe "instruments/edit", type: :view do
  before(:each) do
    @instrument = assign(:instrument, Instrument.create!(
      :reference => "MyString",
      :designation => "MyString",
      :brand => "MyString",
      :model => "MyString",
      :part_number => "MyString",
      :serial_number => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit instrument form" do
    render

    assert_select "form[action=?][method=?]", instrument_path(@instrument), "post" do

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
