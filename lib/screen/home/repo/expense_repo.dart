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

  Future<List<Map<String, dynamic>>> getExpensesDayWise() async{
    var data = await dbHelper.getExpenses();
    return filterExpenseDateWise(arrExpenseData: data.reversed.toList());
  }

  Future<List<Map<String, dynamic>>> getExpensesMonthWise() async{
    var data = await dbHelper.getExpenses();
    return filterExpenseMonthWise(arrExpenseData: data.reversed.toList());
  }

  //yearwise



  //weekwise







  List<Map<String, dynamic>> filterExpenseDateWise({required List<ExpenseModel> arrExpenseData}) {
    var uniqueDates = [];
    List<Map<String, dynamic>> arrDateWiseData = [];
    //Today date
    var today = DateTime.now();
    var yesterday = today.subtract(Duration(days:1));
    var todayDate =
    '${today.year}-${today.month.toString().length == 1 ? '0${today.month}' : today.month}-${today.day.toString().length == 1 ? '0${today.day}' : today.day}';
    var yesterdayDate =
    '${yesterday.year}-${yesterday.month.toString().length == 1 ? '0${yesterday.month}' : yesterday.month}-${yesterday.day.toString().length == 1 ? '0${yesterday.day}' : yesterday.day}';


    for (ExpenseModel model in arrExpenseData) {
      var eachDateFormat = DateTime.parse(model.date!);

      var eachDate =
          '${eachDateFormat.year}-${eachDateFormat.month.toString().length == 1 ? '0${eachDateFormat.month}' : eachDateFormat.month}-${eachDateFormat.day.toString().length == 1 ? '0${eachDateFormat.day}' : eachDateFormat.day}';
      print(eachDate);

      if (!uniqueDates.contains(eachDate)) {
        uniqueDates.add(eachDate);
      }
    }


    for (String eachDate in uniqueDates) {
      List<ExpenseModel> eachDateTransactions = arrExpenseData
          .where((element) => element.date!.contains(eachDate))
          .toList();

      print(todayDate);
      print(yesterdayDate);
      if (eachDate == todayDate) {
        eachDate = 'Today';
      } else if (eachDate == yesterdayDate) {
        eachDate = 'Yesterday';
      }

      var eachDayAmt = 0.0;

      eachDateTransactions.forEach((transaction) {
        if(transaction.expenseType==1){
          eachDayAmt -= transaction.amount!;
        } else {
          eachDayAmt += transaction.amount!;
        }
      });

      Map<String, dynamic> eachDateMap = {};
      eachDateMap['day'] = '$eachDate';
      eachDateMap['amt'] = eachDayAmt.isNegative ? '${eachDayAmt}' : '+${eachDayAmt}';
      eachDateMap['transactions'] = eachDateTransactions;

      arrDateWiseData.add(eachDateMap);
    }

    print(arrDateWiseData);
    return arrDateWiseData;
  }

  List<Map<String, dynamic>> filterExpenseMonthWise({required List<ExpenseModel> arrExpenseData}) {
    var uniqueMonths = [];
    List<Map<String, dynamic>> arrMonthWiseData = [];
    //Today date
    var today = DateTime.now();
    var yesterday = today.subtract(Duration(days:30));
    var thisMonth =
        '${today.year}-${today.month.toString().length == 1 ? '0${today.month}' : today.month}';
    var prevMonth =
        '${yesterday.year}-${yesterday.month.toString().length == 1 ? '0${yesterday.month}' : yesterday.month}';


    for (ExpenseModel model in arrExpenseData) {
      var eachMonthFormat = DateTime.parse(model.date!);

      var eachMonth =
          '${eachMonthFormat.year}-${eachMonthFormat.month.toString().length == 1 ? '0${eachMonthFormat.month}' : eachMonthFormat.month}';
      print(eachMonth);

      if (!uniqueMonths.contains(eachMonth)) {
        uniqueMonths.add(eachMonth);
      }
    }


    for (String eachMonth in uniqueMonths) {
      List<ExpenseModel> eachMonthTransactions = arrExpenseData
          .where((element) => element.date!.contains(eachMonth))
          .toList();

      print(thisMonth);
      print(prevMonth);
      if (eachMonth == thisMonth) {
        eachMonth = 'this Month';
      } else if (eachMonth == prevMonth) {
        eachMonth = 'prev Month';
      }

      var eachMonthAmt = 0.0;

      eachMonthTransactions.forEach((transaction) {
        if(transaction.expenseType==1){
          eachMonthAmt -= transaction.amount!;
        } else {
          eachMonthAmt += transaction.amount!;
        }
      });

      Map<String, dynamic> eachDateMap = {};
      eachDateMap['month'] = '$eachMonth';
      eachDateMap['amt'] = eachMonthAmt.isNegative ? '${eachMonthAmt}' : '+${eachMonthAmt}';
      eachDateMap['transactions'] = eachMonthTransactions;

      arrMonthWiseData.add(eachDateMap);
    }

    print(arrMonthWiseData);
    return arrMonthWiseData;
  }

}