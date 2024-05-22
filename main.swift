class BankAccount {
    var accountNumber: String
    private var _balance: Double

    var balance: Double {
        get {
            return _balance
        }
        set {
            _balance = newValue
        }
    }

    init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self._balance = initialBalance
    }

    func deposit(amount: Double) {
        self.balance += amount
    }

    func withdraw(amount: Double) {
        self.balance -= amount
    }

    deinit {
        print("Account \(accountNumber) is being closed.")
    }


    // Method overloading to show account details
    //To show only the balance and the Account Number
    func statement() -> String {
        return "Account Number: \(accountNumber), Balance: \(balance)"
    }

    //To show the currency and the balance and account number
    func statement(showCurrency: Bool) -> String {
        if showCurrency {
            return "Account Number: \(accountNumber), Balance: $\(balance)"
        } else {
            return statement()
        }
    }

    func statement(includeAccountNumber: Bool) -> String {
        if includeAccountNumber {
            return "Account Number: \(accountNumber)"
        } else {
            return "Balance: \(balance)"
        }
    }

}


//saving class
class SavingsAccount: BankAccount {
    var interestRate: Double

    override var balance: Double {
        get {
            return super.balance
        }
        set {
            super.balance = newValue
        }
    }

    init(accountNumber: String, initialBalance: Double, interestRate: Double) {
        self.interestRate = interestRate
        super.init(accountNumber: accountNumber, initialBalance: initialBalance)
    }

    func applyInterest() {
        let interest = super.balance * (interestRate / 100)
        deposit(amount: interest)
    }

    override func withdraw(amount: Double) {
        if super.balance - amount >= 100 {
            super.withdraw(amount: amount)
        } else {
            print("Withdrawal denied. Balance must remain above $100.")
        }
    }
}

//current Class
class CurrentAccount: BankAccount {
    var overdraftLimit: Double
    
    override var balance: Double {
        get {
            return super.balance + overdraftLimit
        }
        set {
            super.balance = newValue
        }
    }

    init(accountNumber: String, initialBalance: Double, overdraftLimit: Double) {
        self.overdraftLimit = overdraftLimit
        super.init(accountNumber: accountNumber, initialBalance: initialBalance)
    }

    override func withdraw(amount: Double) {
        if super.balance - amount >= -overdraftLimit {
            super.withdraw(amount: amount)
        } else {
            print("Withdrawal denied. Overdraft limit exceeded.")
        }
    }

    
}


//testing the classes

// Main program to demonstrate the use of these classes
func main() {
    //saving account details
    let savings = SavingsAccount(accountNumber: "SavingAcc139", initialBalance: 500, interestRate: 2.0)
    print(savings.statement(showCurrency: true))
    print(savings.statement(includeAccountNumber: true))
    
    print("All Details:\n\(savings.statement())")
    savings.deposit(amount: 200)
    print(savings.statement(showCurrency: true))
    savings.applyInterest()
    print(savings.statement(showCurrency: true))
    savings.withdraw(amount: 300)
    print(savings.statement(showCurrency: true))
    savings.withdraw(amount: 600)
    print(savings.statement(showCurrency: true))

    let current = CurrentAccount(accountNumber: "C12345", initialBalance: 500, overdraftLimit: 100)
    print(current.statement(showCurrency: true))
    print(current.statement(includeAccountNumber: false))
    print(current.statement())
    current.deposit(amount: 200)
    print(current.statement(showCurrency: true))
    current.withdraw(amount: 600)
    print(current.statement(showCurrency: true))
    current.withdraw(amount: 200)
    print(current.statement(showCurrency: true))
}

main()