class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.balance < @amount
      false
    elsif @sender.valid? == true && @receiver.valid? == true
      true
    else false
    end
  end

  def execute_transaction
      if valid? == true && @status == "pending"
      @sender.deposit(amount*(-1))
      @receiver.deposit(amount)
      @status = "complete"
    else @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(amount*(-1))
      @status = "reversed"
    end
  end

end
