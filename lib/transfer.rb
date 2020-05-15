class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @status = "pending" 
    @receiver = receiver
    @sender = sender 
    @amount = amount 
  end
  
  def valid? 
    @sender.valid? && @receiver.valid? ? true : false 
  end 
  
  def execute_transaction 
    if @sender.balance > @amount && @sender.valid?
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
    else @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end
