import 'dart:io';

import 'package:flutter_app/model/expense.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseHelper {
  ExpenseHelper._();
  static final ExpenseHelper db = ExpenseHelper._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "/ExpenseDB2.db";

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE expenses (
          id INTEGER PRIMARY KEY,
          amount REAL,
          date TEXT,
          category TEXT)
      """);
      await db.execute(
          "INSERT INTO expenses ('id', 'amount', 'date','category') values (?, ?, ?, ?)",
          [1, 1000, '2019-04-01 10:00:00', "Food"]);
    });
  }

  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    List<Map> results = await db.query("expenses",
        columns: ['id', 'amount', 'date', 'category'], orderBy: "date DESC");
    List<Expense> expenses = new List();
    results.forEach((result) {
      Expense expense = Expense.fromMap(result);
      expenses.add(expense);
    });
    return expenses;
  }

  Future<Expense> getExpenseById(int id) async {
    final db = await database;
    var result = await db.query("expenses", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Expense.fromMap(result.first) : Null;
  }

  Future<double> getTotalExpense() async {
    final db = await database;
    List<Map> list =
        await db.rawQuery("Select SUM(amount) as amount from expenses");
    return list.isNotEmpty ? list[0]["amount"] : Null;
  }

  Future<Expense> insert(Expense expense) async {
    final db = await database;
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM expenses");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into expenses (id, amount, date, category)"
        " VALUES (?, ?, ?, ?)",
        [id, expense.amount, expense.date.toString(), expense.category]);
    return Expense(id, expense.amount, expense.date, expense.category);
  }

  update(Expense product) async {
    final db = await database;
    var result = await db.update("expenses", product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  delete(int id) async {
    final db = await database;
    db.delete("expenses", where: "id = ?", whereArgs: [id]);
  }
}
