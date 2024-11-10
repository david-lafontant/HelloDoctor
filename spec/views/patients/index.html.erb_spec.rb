require 'rails_helper'

RSpec.describe "patients/index", type: :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        first_name: "First Name",
        last_name: "Last Name",
        sex: 2,
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        country: "Country",
        phone: 3,
        email: "Email",
        user: nil
      ),
      Patient.create!(
        first_name: "First Name",
        last_name: "Last Name",
        sex: 2,
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        country: "Country",
        phone: 3,
        email: "Email",
        user: nil
      )
    ])
  end

  it "renders a list of patients" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Line1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Line2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
