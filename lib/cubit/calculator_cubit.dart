import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_state.dart';  // Импортируем состояние

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());

  // Переменные для хранения данных
  double? _numberA;
  double? _numberB;
  bool _agreementChecked = false;
  String? _errorA;
  String? _errorB;
  final String _studentName = 'Урюмцев В.Э.';

  // Начальный экран ввода
  void showInputScreen() {
    emit(CalculatorInputState(
      studentName: _studentName,
      numberA: _numberA,
      numberB: _numberB,
      agreementChecked: _agreementChecked,
      errorA: _errorA,
      errorB: _errorB,
    ));
  }

  // Обновление числа A
  void updateNumberA(String value) {
    if (value.isEmpty) {
      _numberA = null;
      _errorA = null;
    } else {
      final parsed = double.tryParse(value);
      if (parsed == null) {
        _errorA = 'Введите корректное число';
      } else {
        _numberA = parsed;
        _errorA = null;
      }
    }
    showInputScreen();
  }

  // Обновление числа B
  void updateNumberB(String value) {
    if (value.isEmpty) {
      _numberB = null;
      _errorB = null;
    } else {
      final parsed = double.tryParse(value);
      if (parsed == null) {
        _errorB = 'Введите корректное число';
      } else {
        _numberB = parsed;
        _errorB = null;
      }
    }
    showInputScreen();
  }

  // Переключение чекбокса
  void toggleAgreement(bool value) {
    _agreementChecked = value;
    showInputScreen();
  }

  // Валидация и переход к результату
  void calculate() {
    if (_numberA == null) {
      _errorA = 'Введите число a';
      showInputScreen();
      return;
    }
    if (_numberB == null) {
      _errorB = 'Введите число b';
      showInputScreen();
      return;
    }
    if (!_agreementChecked) {
      showInputScreen();
      return;
    }

    emit(CalculatorResultState(
      numberA: _numberA!,
      numberB: _numberB!,
    ));
  }

  // Сброс к начальному состоянию
  void reset() {
    _numberA = null;
    _numberB = null;
    _agreementChecked = false;
    _errorA = null;
    _errorB = null;
    emit(CalculatorInitial());
  }
}