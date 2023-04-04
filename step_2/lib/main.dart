
// ignore_for_file: avoid_print

void main() {
  List<int> values = [1, 5, 20, 6];
  int mul = 100;

  print(values); // output [1, 5, 20, 6]
  print(
    values.map((number) => number * 2).toList()
  ); // output [2, 10, 40, 12]

  print(
    values.map(double).toList()
  ); // output [2, 10, 40, 12]
  
  print(values.map(
    (value) => multiply(value, mul)).toList()
  ); // output [100, 500, 2000, 600]

  List<int> doubledValues = [
    for (int i in values) i * 10
  ];

  print('\ndoubledValues');
  print(doubledValues);
}

int double(int number) {
  return number * 2;
}

int multiply(int number, [int? mul]) {
  return mul == null ? number * 2 : number * mul;
}
