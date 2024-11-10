require 'rails_helper'

RSpec.describe "patients/edit", type: :view do
  let(:patient) {
    Patient.create!(
      first_name: "MyString",
      last_name: "MyString",
      sex: 1,
      address_line1: "MyString",
      address_line2: "MyString",
      city: "MyString",
      state: "MyString",
      country: "MyString",
      phone: 1,
      email: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:patient, patient)
  end

  it "renders the edit patient form" do
    render

    assert_select "form[action=?][method=?]", patient_path(patient), "post" do

      assert_select "input[name=?]", "patient[first_name]"

      assert_select "input[name=?]", "patient[last_name]"

      assert_select "input[name=?]", "patient[sex]"

      assert_select "input[name=?]", "patient[address_line1]"

      assert_select "input[name=?]", "patient[address_line2]"

      assert_select "input[name=?]", "patient[city]"

      assert_select "input[name=?]", "patient[state]"

      assert_select "input[name=?]", "patient[country]"

      assert_select "input[name=?]", "patient[phone]"

      assert_select "input[name=?]", "patient[email]"

      assert_select "input[name=?]", "patient[user_id]"
    end
  end
end
