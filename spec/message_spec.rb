require 'rspec'
require 'message'

describe '#Message' do
  
  describe('.clear') do
    it("clears all messages") do
      message = Message.new({:user_post => "Hello humans!", :user => "Mr. Robot", :post_id => nil})
      message.save()
      message2 = Message.new({:user_post => "Hello to you too fellow human", :user => "Bender", :post_id => nil})
      message2.save()
      Message.clear()
      expect(Message.all).to(eq([]))
    end
  end

  describe('#initialize') do
    it("initializes a Message object") do
      message = Message.new({:user_post => "Hello humans!", :user => "Mr. Robot", :post_id => nil})
      expect(message.class).to(eq(Message))
    end
  end

  describe('.all') do
    it("returns an empty hash when there are no messages") do
      expect(Message.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same post if it has the same atributes of another post") do
      message = Message.new({:user_post => "Hello humans!", :user => "Mr. Robot", :post_id => nil})
      message2 = Message.new({:user_post => "Hello humans!", :user => "Mr. Robot", :post_id => nil})
      expect(message).to(eq(message2))
    end
  end

  describe('#save') do
    it('saves a messsage') do
      message = Message.new({:user_post => "Hello humans!", :user => "Mr. Robot", :post_id => nil})
      message.save()
      message2 = Message.new({:user_post => "Hello to you too fellow human", :user => "Bender", :post_id => nil})
      message2.save()
      expect(Message.all()).to(eq([message, message2]))
    end
  end
end
