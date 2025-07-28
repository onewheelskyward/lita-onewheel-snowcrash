require 'spec_helper'

describe Lita::Handlers::OnewheelShiftcal, lita_handler: true do
  it { is_expected.to route_command('shift xyz') }

  it 'will generate a random-len chain' do
    send_command 'shift grilled'
    expect(replies.last).not_to be nil
  end

end
