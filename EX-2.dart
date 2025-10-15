class BankAccount {
  String _firstName, _lastName;
  final int _userID, _mobileNum;
  double _balance;
  String _password;

  BankAccount({
    required String firstName,
    required String lastName,
    required int userID,
    required int mobileNum,
    required double balance,
    required String password,
  }) : _firstName = firstName,
       _lastName = lastName,
       _userID = userID,
       _mobileNum = mobileNum,
       _balance = balance,
       _password = password;

  String get fullName => _lastName + " " + _firstName;
  int get bankID => _userID;
  int get mobileNumb => _mobileNum;
  String get password => _password;
  double get balance => _balance;

  void withdraw(double amount) {
    if (amount > _balance) {
      print("Error! Cannot withdraw more than the current balance");
      return null;
    } else if (amount < 0) {
      print("Error! Money cannot be negative.");
      return null;
    }
    _balance -= amount;
    print("Successfully withdraw the money.");
  }

  void credits(double amount) {
    if (amount < 0) {
      print("Error! Money cannot be negative.");
      return null;
    }
    _balance += amount;
    print("Successfully add deposit the cash.");
  }

  @override
  String toString() {
    return """
Full Name: $fullName
UserID: $bankID
Mobile Number: $mobileNumb
Balance: $balance
""";
  }
}

class Bank {
  // TODO
  final String bankName;
  final String location;
  final String email;
  final String swiftCode;
  final int contactNum;
  final String? website;

  final List<BankAccount> _accounts = [];

  Bank({
    required this.bankName,
    required this.location,
    required this.email,
    required this.swiftCode,
    required this.contactNum,
    this.website,
  });

  BankAccount createAccount({
    required String firstName,
    required String lastName,
    required int userID,
    required int mobileNum,
    required double balance,
    required String password,
  }) {
    for (int i = 0; i < _accounts.length; i++) {
      for (int j = 0; j < _accounts.length; j++) {
        if (_accounts[j]._userID == _accounts[i]._userID) {
          print("The account ID already exists");
          break;
        }
      }
    }
    final account = BankAccount(
      firstName: firstName,
      lastName: lastName,
      userID: userID,
      mobileNum: mobileNum,
      balance: balance,
      password: password,
    );
    _accounts.add(account);
    return account;
  }
}

void main() {
  Bank myBank = Bank(
    bankName: "ABA bank",
    location: "Pochentong",
    email: "ababank.cambodia@gmail.com",
    swiftCode: "ABAAKHPP",
    contactNum: 012345678,
  );
  BankAccount ronanAccount = myBank.createAccount(
    firstName: "Ronan",
    lastName: "TheBest",
    userID: 1,
    mobileNum: 012345678,
    balance: 0,
    password: "R0N4nTh3B3sT",
  );

  print(ronanAccount.balance);
  ronanAccount.credits(100);
  print(ronanAccount.balance);
  ronanAccount.withdraw(50);
  print(ronanAccount.balance);

  // ronanAccount.withdraw(75);

  myBank.createAccount(
    firstName: "Hongly",
    lastName: "Um",
    userID: 1,
    mobileNum: 123114141,
    balance: 1,
    password: "gg1231",
  );

  // Bank myBank = Bank(name: "CADT Bank");
  // BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  // print(ronanAccount.balance); // Balance: $0
  // ronanAccount.credit(100);
  // print(ronanAccount.balance); // Balance: $100
  // ronanAccount.withdraw(50);
  // print(ronanAccount.balance); // Balance: $50

  // try {
  //   ronanAccount.withdraw(75); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Insufficient balance for withdrawal!
  // }

  // try {
  //   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Account with ID 100 already exists!
  // }
}
