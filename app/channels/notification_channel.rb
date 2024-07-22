class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # You should define a method to handle broadcasting
  def notify(user, title:, body:)
    NotificationChannel.broadcast_to(user, { title: title, body: body })
  end
end
