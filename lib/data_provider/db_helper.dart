import 'package:expenser_113/models/cat_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/expense_model.dart';
import '../models/user_model.dart';

class DbHelper {
  static const USER_TABLE = 'user';
  static const USER_ID = 'user_id';
  static const USER_NAME = 'user_name';
  static const USER_EMAIL = 'user_email';
  static const USER_PASS = 'user_pass';
  static const USER_IMG = 'user_img';
  //balance
  static const USER_MOBILE_NO = 'user_number';

  static const EXPENSE_TABLE = 'expense_table';
  static const EXPENSE_ID = 'expense_id';
  static const EXPENSE_DATE = 'expense_date';
  static const TITLE = 'expense_title';
  static const DESC = 'expense_desc';
  static const CATEGORY_ID = 'category_id';
  static const AMOUNT = 'expense_amount';
  static const BALANCE = 'balance';
  static const EXPENSE_TYPE = 'expense_type';

  static const CAT_TABLE = 'cat_table';
  static const CAT_ID = 'cat_id';
  static const CAT_TITLE = 'cat_title';
  static const CAT_IMG = 'expense_img';

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();
    await mDirectory.create(recursive: true);
    var mPath = '${mDirectory.path}/expense_db.db';

    return openDatabase(mPath, version: 1, onCreate: (db, version) {
      db.execute(
          'create table $USER_TABLE ($USER_ID integer primary key autoincrement,'
          '$USER_NAME text, $USER_EMAIL text, $USER_PASS text, $USER_MOBILE_NO integer)');

      db.execute(
          'create table $EXPENSE_TABLE ($EXPENSE_ID integer primary key autoincrement,'
          '$EXPENSE_DATE text, $TITLE text, $DESC text, $CATEGORY_ID integer, $AMOUNT integer,'
          '$BALANCE integer, $EXPENSE_TYPE integer, $USER_ID integer)');

      db.execute(
          'create table $CAT_TABLE ($CAT_ID integer primary key autoincrement,'
          '$CAT_TITLE text, $CAT_IMG text)');

      db.insert(
          CAT_TABLE,
          CatModel(
                  title: "Grocery",
                  path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Coffee",
              path: "assets/images/expense_type/coffee.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Fast-Food",
              path: "assets/images/expense_type/fast-food.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Gift",
              path: "assets/images/expense_type/gift-box.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Shopping",
              path: "assets/images/expense_type/shopping-bag.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Snacks",
              path: "assets/images/expense_type/snack.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Grocery",
              path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Grocery",
              path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Grocery",
              path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Grocery",
              path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());

      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Grocery",
              path: "assets/images/expense_type/vegetables.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Movie",
              path: "assets/images/expense_type/popcorn.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Travel",
              path: "assets/images/expense_type/travel.png")
              .toMap());
      db.insert(
          CAT_TABLE,
          CatModel(
              title: "Recharge/Bill",
              path: "assets/images/expense_type/mobile-transfer.png")
              .toMap());


    }, onUpgrade: (db, odlVersion, newVersion){

    });

  }

  Future<bool> addExpense(ExpenseModel expense) async {
    var db = await openDB();
    var check = await db.insert(EXPENSE_TABLE, expense.toMap());
    return check > 0;
  }

  Future<List<ExpenseModel>> getExpenses() async {
    var db = await openDB();
    var sp = await SharedPreferences.getInstance();
    var userId = sp.getInt('userId');
    var expensesList = await db
        .query(EXPENSE_TABLE, where: '$USER_ID = ?', whereArgs: ['$userId']);
    List<ExpenseModel> listExpenseModel = [];
    for (Map<String, dynamic> expenses in expensesList) {
      listExpenseModel.add(ExpenseModel.fromMap(expenses));
    }
    return listExpenseModel;
  }

  Future<List<CatModel>> getCategories() async{
    var db = await openDB();
    var catData = await db.query(CAT_TABLE);

    List<CatModel> listCatModel = [];
    for (Map<String, dynamic> cat in catData) {
      listCatModel.add(CatModel.fromMap(cat));
    }
    return listCatModel;
  }

  deleteExpense(String id) async {
    var mDb = await openDB();
    mDb.delete(EXPENSE_TABLE, where: '$EXPENSE_ID = ?', whereArgs: [id]);
  }

  Future<int> signUp(UserModel user) async {
    var db = await openDB();
    int check;
    if (await checkUser(user.email!)) {
      check = await db.insert(USER_TABLE, user.toMap());
    } else
      check = -1;
    return check;
  }

  Future<bool> signIn(String email, String pass) async {
    var db = await openDB();
    List<Map<String, dynamic>> data = await db.query(USER_TABLE,
        where: '$USER_EMAIL = ? and $USER_PASS = ?', whereArgs: [email, pass]);
    if (data.isNotEmpty) {
      var sp = await SharedPreferences.getInstance();
      sp.setInt('userId', data[0][USER_ID]);
    }
    return data.isNotEmpty;
  }

  Future<bool> checkUser(String email) async {
    var db = await openDB();
    List<Map<String, dynamic>> data = await db
        .query(USER_TABLE, where: '$USER_EMAIL = ?', whereArgs: [email]);
    return data.isEmpty;
  }
}
