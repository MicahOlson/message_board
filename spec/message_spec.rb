require 'rspec'
require 'message'

describe '#Message' do
  
  describe('.all') do
    it("returns an empty hash when there are no messages") do
      expect(Message.all).to(eq([]))
    end
  end

  # before(:each) do
  #   Message.clear()
  # end

  # describe('#save') do
  #   it('saves a messsage') do
  #     message = Message.new({:user_post => "Hello humans!",:user => "Mr. Robot"})
  #     message.save()
  #     message2 = Message.new({:user_post => "Hello to you too fellow human",:user => "Bender"})
  #     message2.save()
  #     expect(Message.all()).to(eq([message, message2]))
  #   end
  # end



end