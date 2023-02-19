class Chat < ApplicationRecord
  validates :message, length: { maximum: 280 }, presence: true

  after_create :new_message

  private

  def new_message
    ActionCable.server.broadcast('chat_homepage', {body: self.message})
  end
end
