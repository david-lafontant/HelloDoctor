require 'rails_helper'

RSpec.describe 'patients/show', type: :view do
  before(:each) do
    assign(:patient, Patient.create!(
                       first_name: 'First Name',
                       last_name: 'Last Name',
                       sex: 2,
                       address_line1: 'Address Line1',
                       address_line2: 'Address Line2',
                       city: 'City',
                       state: 'State',
                       country: 'Country',
                       phone: 3,
                       email: 'Email',
                       user: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Address Line1/)
    expect(rendered).to match(/Address Line2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
