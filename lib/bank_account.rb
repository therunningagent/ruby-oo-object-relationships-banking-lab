class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def self.all
        @@all
    end 

    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end 

    def deposit(amount)
        self.balance += amount
    end 

    def display_balance
        p "Your balance is $#{self.balance}."
    end 

    def valid?
       self.balance > 0 && self.status == "open"
    end 

    def close_account
        self.status = "closed"
    end 

end
