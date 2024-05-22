# Simple Banking System in Swift

## Objective
The objective of this assignment is to create a set of classes in Swift to represent a simple banking system. This will demonstrate your understanding of inheritance, method overloading, method overriding, computed properties, initializers, and deinitializers.

## Assignment Details

### Classes to Create
1. `BankAccount`
2. `SavingsAccount` (inherits from `BankAccount`)
3. `CurrentAccount` (inherits from `BankAccount`)

### Requirements

#### BankAccount Class

**Properties:**
- `accountNumber: String`
- `balance: Double` (computed property)

**Initializers:**
- Designated initializer that takes `accountNumber` and `initialBalance`.

**Methods:**
- `deposit(amount: Double)`
- `withdraw(amount: Double)` (virtual method to be overridden in subclasses)

**Deinitializer:**
- Print a message indicating the account is being closed.

#### SavingsAccount Class

**Inherits from:**
- `BankAccount`

**Additional Properties:**
- `interestRate: Double`

**Initializers:**
- Designated initializer that takes `accountNumber`, `initialBalance`, and `interestRate`.

**Methods:**
- `applyInterest()`
- Override `withdraw(amount: Double)` to impose a condition: withdraw only if balance remains above a minimum limit ($100).

**Computed Properties:**
- `balance` to include interest.

#### CurrentAccount Class

**Inherits from:**
- `BankAccount`

**Additional Properties:**
- `overdraftLimit: Double`

**Initializers:**
- Designated initializer that takes `accountNumber`, `initialBalance`, and `overdraftLimit`.

**Methods:**
- Override `withdraw(amount: Double)` to allow overdraft up to the overdraftLimit.

**Computed Properties:**
- `balance` to reflect the effective available balance considering the overdraft.

### Instructions
1. Implement all required classes and methods.
2. Demonstrate method overloading by creating a method `statement` in `BankAccount` that shows account details with different formats.
3. Provide an example of how these classes would be used in a main program.
