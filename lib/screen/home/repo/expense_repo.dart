import 'package:expenser_113/data_provider/db_helper.dart';
import 'package:expenser_113/models/cat_model.dart';
import 'package:expenser_113/models/expense_model.dart';

class ExpenseRepo {
  DbHelper dbHelper;

  ExpenseRepo({required this.dbHelper});

  Future<bool> addExpense(ExpenseModel newExpense) async{
    var check = await dbHelper.addExpense(newExpense);
    return check;
  }

  Future<List<ExpenseModel>> getExpense() async{
    var data = await dbHelper.getExpenses();
    return data;
  }

  Future<List<CatModel>> getCategories() async{
    var data = await dbHelper.getCategories();
    return data;
  }



}