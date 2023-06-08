import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expenser_113/models/cat_model.dart';
import 'package:expenser_113/models/expense_model.dart';
import 'package:meta/meta.dart';

import '../../repo/expense_repo.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseRepo repo;
  ExpenseBloc({required this.repo}) : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var check = await repo.addExpense(event.newExpense);
      if(check){
        var allExpense = await repo.getExpensesMonthWise();
        emit(ExpenseLoadedState(listExpenses: allExpense));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense not added!!"));
      }
    });

    on<GetExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var allExpense = await repo.getExpensesMonthWise();
      emit(ExpenseLoadedState(listExpenses: allExpense));
    });

  }
}
