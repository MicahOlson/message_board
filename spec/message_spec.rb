require 'rspec'
require 'message'
require 'pry'

describe '#Message' do

  before(:each) do
    Message.clear
  end

  describe('#initialize') do
    it("initializes a Message object") do
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
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
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      message2 = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      expect(message).to(eq(message2))
    end
  end

  describe('#save') do
    it('saves a messsage') do
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      message.save
      message2 = Message.new({:user_post => "Hello to you too fellow human", :title => "Kill All Humans", :user => "Bender", :id => nil})
      message2.save
      expect(Message.all()).to(eq([message, message2]))
    end
  end

  describe('.clear') do
    it("clears all messages") do
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      message.save
      message2 = Message.new({:user_post => "Hello to you too fellow human", :title => "Kill All Humans", :user => "Bender", :id => nil})
      message2.save
      Message.clear
      expect(Message.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an message by id") do
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      message.save
      message2 = Message.new({:user_post => "Hello to you too fellow human", :title => "Kill All Humans", :user => "Bender", :id => nil})
      message2.save
      expect(Message.find(message.id)).to(eq(message))
    end
  end

  describe('#delete') do
    it("deletes a message by id") do
      message = Message.new({:user_post => "Hello humans!", :title => "F Society", :user => "Mr. Robot", :id => nil})
      message.save
      message2 = Message.new({:user_post => "Hello to you too fellow human", :title => "Kill All Humans", :user => "Bender", :id => nil})
      message2.save
      message.delete()
      expect(Message.all).to(eq([message2]))
    end
  end
end
