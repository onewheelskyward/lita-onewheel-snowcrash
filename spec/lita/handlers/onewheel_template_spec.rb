require 'spec_helper'

describe Lita::Handlers::OnewheelSnowcrash, lita_handler: true do
  it { is_expected.to route_command('snowcrash') }
  it { is_expected.to route_command('snowcrash 22') }

  it 'will generate a random-len chain' do
    send_command 'snowcrash'
    expect(replies.last).not_to be nil
  end

  it 'will generate a six-word chain' do
    send_command 'snowcrash 6'
    expect(replies.last).not_to be nil
    expect(replies.last.split(' ').count).to be(6)
  end
end
