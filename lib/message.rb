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

  # def save
  #   @@messages[self.post_id] = Message.new(self.user_post, self.user, self.post_id)
  # end
end