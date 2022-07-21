import 'dart:async';

Future<String> createOrderMessage () async {
  print('Awaiting user order...');
  var order = await getUserOrder();
  print('Your order is: $order');
  return "Done";
}

Future<String> createOrderMessageNotDelay () async {
  print('Awaiting user order...');
  var order = await getUserOrderNotDelay();
  print('Your order is: $order');
  Future.delayed(Duration(seconds: 1), () {});
  print('End delay');
  return "Done";
}

Future<String> getUserOrderNotDelay() {
  // Imagine that this function is more complex and slow.
  return Future(() => 'Large Latte not delay');
}

Future<String> getUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<void> printLine()async {
  print("test");
}

Stream<int> createNumberStream(int number) async* {
  for (int i = 1; i <= number; i++) {
    yield i;
  }
}

void main(List<String> arguments) {
  // Calling the stream generation
  var stream = createNumberStream(5);
  // Listening to Stream yielding each number
  stream.listen((event) {
    print('----------');
    print('event: $event');
  });
}

// main() async {

  // await printLine();
  // await createOrderMessageNotDelay();
  // print("${ createOrderMessageNotDelay()}---- 1 ");
  // print("${ createOrderMessageNotDelay()}---- 2 ");
  // print("line 1");
  // await countSeconds(4);
  // print("line 2");
  // await createOrderMessage();
  // print("line 3");
  // print("line 4");
  // print("line 5");
  // print("${await createOrderMessageNotDelay()}---- 3 ");
  // print("${await createOrderMessageNotDelay()}---- 4 ");
// }

// You can ignore this function - it's here to visualize delay time in this example.
Future<void> countSeconds(s)async{
  for( var i = 1 ; i <= s; i++ ) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
