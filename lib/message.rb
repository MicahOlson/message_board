class Message
  attr_accessor :user_post, :title, :user 
  attr_reader :id

  @@messages = {}
  @@total_rows = 0

  def initialize(attributes)
    @user = attributes.fetch(:user)
    @title = attributes.fetch(:title)
    @user_post = attributes.fetch(:user_post)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@messages.values
  end

  def save
    @@messages[self.id] = Message.new({:user_post => self.user_post, :title => self.title, :user => self.user, :id => self.id})
  end

  def ==(compare_post)
    self.user_post = compare_post.user_post
  end

  def self.clear
    @@messages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@messages[id]
  end
end
