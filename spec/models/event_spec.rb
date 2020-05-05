require('rails_helper')

RSpec.describe(Event, type: :model) do
  before :each do
    @user = User.create(name: 'foobar')
    @event = @user.events.create(desc: 'our first test event', date: '22/04/2017')
  end

  context 'with valid details' do
    it 'should create an event' do
      expect(@event).to(be_valid)
    end

    it 'should have an event desc' do
      expect(@event.desc).to(be_present)
    end
  end

  context 'with invalid details' do
    it 'should not be valid' do
      @event.desc = '   '
      expect(@event).to_not(be_valid)
    end
  end
end
