import 'package:flutter/material.dart';
import 'package:flutter_app/helper/expenses_list_model.dart';
import 'package:flutter_app/page/expenses/form_expenses.dart';
import 'package:scoped_model/scoped_model.dart';

class ExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<ExpenseListModel>(
        builder: (context, child, expenses) {
          return ListView.separated(
            itemCount: expenses.items == null ? 1 : expenses.items.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ListTile(
                  title: Text(
                    "Total expenses: " + expenses.totalExpense.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                index = index - 1;
                return Dismissible(
                  key: Key(expenses.items[index].id.toString()),
                  onDismissed: (direction) {
                    expenses.delete(expenses.items[index]);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Item with id, " +
                              expenses.items[index].id.toString() +
                              " is dismissed",
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPage(
                            id: expenses.items[index].id,
                            expenses: expenses,
                          ),
                        ),
                      );
                    },
                    leading: Icon(Icons.monetization_on),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text(
                      expenses.items[index].category +
                          ": " +
                          expenses.items[index].amount.toString() +
                          " \nspent on " +
                          expenses.items[index].formattedDate,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
      floatingActionButton: ScopedModelDescendant<ExpenseListModel>(
        builder: (context, child, expenses) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScopedModelDescendant<ExpenseListModel>(
                    builder: (context, child, expenses) {
                      return FormPage(
                        id: 0,
                        expenses: expenses,
                      );
                    },
                  ),
                ),
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
