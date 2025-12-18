abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {
  final String studentName = 'Урюмцев В.Э.'; 
}

class CalculatorInputState extends CalculatorState {
  final String studentName;
  final double? numberA;
  final double? numberB;
  final bool agreementChecked;
  final String? errorA;
  final String? errorB;

  CalculatorInputState({
    required this.studentName,
    this.numberA,
    this.numberB,
    this.agreementChecked = false,
    this.errorA,
    this.errorB,
  });
}

class CalculatorResultState extends CalculatorState {
  final double numberA;
  final double numberB;
  final double result;
  final String formula;

  CalculatorResultState({
    required this.numberA,
    required this.numberB,
  })  : result = (numberA + numberB) * (numberA + numberB),
        formula = '($numberA + $numberB)² = ${numberA + numberB}² = ${(numberA + numberB) * (numberA + numberB)}';
}