require('rails_helper')

RSpec.describe(User, type: :model) do
  before :each do
    @user = User.create(name: 'myname')
  end

  context 'with valid details' do
    it 'should create a user' do
      expect(@user).to(be_valid)
    end

    it 'should have a name' do
      expect(@user.name).to(be_present)
    end
  end

  context 'with invalid details' do
    it 'should not be valid' do
      @user.name = '   '
      expect(@user).to_not(be_valid)
    end

    it 'should have a unique name' do
      duplicate_name = @user.dup
      @user.save
      expect(duplicate_name).to_not(be_valid)
    end
  end
end
