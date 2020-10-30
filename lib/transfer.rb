require 'pry'

class Transfer 

  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def self.all
    @@all
  end 

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount 
    @@all << self 
  end 

  def valid?
    sender.valid? && receiver.valid? 
  end

  def execute_transaction
    if self.valid? && sender.balance >= amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if self.valid? && receiver.balance >= amount && self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
    end
  end 


end
