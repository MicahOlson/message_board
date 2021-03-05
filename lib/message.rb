class Message
  attr_accessor :user_post, :user 
  attr_reader :post_id

  @@messages = {}
  @@id = 0

  def initialize(attributes)
    @user_post = attributes.fetch(:user_post)
    @user = attributes.fetch(:user)
    @post_id = attributes.fetch(:post_id) || @@id += 1
  end

  def self.all
    @@messages.values
  end

  def save
    @@messages[self.post_id] = Message.new({:user_post => self.user_post, :user => self.user, :post_id => self.post_id})
  end

  def ==(compare_post)
    self.user_post = compare_post.user_post
  end

  def self.clear
    @@messages = {}
    @@id = 0
  end
end
