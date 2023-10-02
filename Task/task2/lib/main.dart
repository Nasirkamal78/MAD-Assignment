import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankingScreen(),
    );
  }
}

class BankingScreen extends StatefulWidget {
  @override
  _BankingScreenState createState() => _BankingScreenState();
}

class _BankingScreenState extends State<BankingScreen> {
  Map<int, double> accounts = {};

  int currentAccountNumber = 0;
  double currentBalance = 0.0;

  void createAccount() {
    currentAccountNumber = UniqueKey().hashCode % 100000;
    accounts[currentAccountNumber] = 0.0;
    currentBalance = 0.0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Created'),
          content: Text('Account number: $currentAccountNumber'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void deposit(double amount) {
    if (amount > 0) {
      // accounts[currentAccountNumber] +=  amount;
      // currentBalance = accounts[currentAccountNumber];
      double accountBalance = accounts[currentAccountNumber] ?? 0.0;
      accounts[currentAccountNumber] = accountBalance + amount;
      currentBalance = accounts[currentAccountNumber]!;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Deposit Successful'),
            content: Text('New balance: $currentBalance'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Amount'),
            content: Text('Please enter a valid deposit amount.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= currentBalance) {
      //   final accountBalance = accounts[currentAccountNumber] ?? 0.0;
      // accounts[currentAccountNumber] = accountBalance + amount;
      // currentBalance = accounts[currentAccountNumber]!
      double accountBalance = accounts[currentAccountNumber] ?? 0.0;
      accounts[currentAccountNumber] = accountBalance - amount;
      currentBalance = accounts[currentAccountNumber]!;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Withdrawal Successful'),
            content: Text('New balance: $currentBalance'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (amount <= 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Amount'),
            content: Text('Please enter a valid withdrawal amount.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Insufficient Balance'),
            content:
                Text('You do not have sufficient balance for this withdrawal.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void checkBalance() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Balance'),
          content: Text(
              'Account number: $currentAccountNumber\nBalance: $currentBalance'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Banking System',
        ),
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: createAccount,
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(25.0),
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                  textStyle: TextStyle(fontSize: 20.0),
                  backgroundColor: Colors.black38),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Deposit'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter amount to deposit'),
                        onChanged: (value) {
                          double amount = double.tryParse(value) ?? 0.0;
                          deposit(amount);
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(25.0),
                  padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 20),
                  textStyle: TextStyle(fontSize: 20.0),
                  backgroundColor: Colors.black38),
              child: Text('Deposit'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Withdraw'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Enter amount to withdraw'),
                        onChanged: (value) {
                          double amount = double.tryParse(value) ?? 0.0;
                          withdraw(amount);
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(25.0),
                  padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
                  textStyle: TextStyle(fontSize: 20.0),
                  backgroundColor: Colors.black38),
              child: Text('Withdraw'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: checkBalance,
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(25.0),
                  padding: EdgeInsets.symmetric(horizontal: 37.0, vertical: 20),
                  textStyle: TextStyle(fontSize: 20.0),
                  backgroundColor: Colors.black38),
              child: Text('Check Balance'),
            ),
          ],
        ),
      ),
    );
  }
}
