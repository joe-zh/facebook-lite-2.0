class Friendship < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: :sender_id
  belongs_to :user, class_name: 'User', foreign_key: :receiver_id

  def self.send_friend_request(current_user, receiver)
    Friendship.create(sender_id: current_user.id, receiver_id: receiver.id, is_friend: false)
  end

  def self.accept_friend_request(current_user, sender)
    Friendship.where(sender_id: sender.id, receiver_id: current_user.id).first.update(is_friend: true)
  end

  def self.reject_friend_request(current_user, sender)
    Friendship.where(sender_id: sender.id, receiver_id: current_user.id).first.destroy
  end
end
