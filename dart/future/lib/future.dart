
void main() async {
  // // 1. BASIC FUTURE
  // print('FUTURE WITHOUT VALUE');
  // basicFuture();

  // 2. FUTURE WITH VALUE 
  // print('FUTURE WITH VALUE');

  // // 2.1 `await` - You can use await to wait value from Future function
  // final intFutureA = await getIntFuture(2);
  // print('intFutureA > $intFutureA');

  // // 2.2 `then` - You can use then to accept Future Value
  // getIntFuture(4).then((value) {
  //   print('intFuture B > $value');
  // });
  // print('Run next line');

  // // 2.3 `whenComplete` - runs code after future is completed
  // getIntFuture(4).then((value) {
  //   print('intFuture B > $value');
  // }).whenComplete(() {
  //   print('completed getIntFuture');
  // });

  // 2.4 `Future.wait` - runs bunch of future function asynchronously
  // Future.wait([
  //   delayedFuture(1),
  //   delayedFuture(8),
  //   delayedFuture(4),
  // ]);

  // Overlapping Future functions
  // final stopwatch = Stopwatch();
  // stopwatch.start();

  // final futureA = getIntFuture(5, seconds: 5);
  // final futureB = delayedFuture(6);

  // final valueFromFutureA = await futureA;
  // print('value From FutureA $valueFromFutureA');
  // final futureC = getIntFuture(valueFromFutureA + 5);

  // await futureB;
  // final valueFromFutureC = await futureC;
  // print('value From FutureC $valueFromFutureC');

  // stopwatch.stop();
  // print('Elapsed time > ${stopwatch.elapsed}');

  // Without overlap
  // final stopwatch = Stopwatch();
  // stopwatch.start();

  // final valueFromFutureA = await getIntFuture(5, seconds: 5);
  // await delayedFuture(6);

  // print('value From FutureA $valueFromFutureA');
  // final valueFromFutureC = await getIntFuture(valueFromFutureA + 5);
  // print('value From FutureC $valueFromFutureC');

  // stopwatch.stop();
  // print('Elapsed time > ${stopwatch.elapsed}');


  // 3. FUTURE WITH ERROR

  // 3.1 Future with error will causing the program stop processing next line
  // await getErrorFuture();
  // print('This line will not executed');

  // 3.2 `onError` - Future with error and onError to catch error
  // await getErrorFuture().onError((error, stackTrace) {
  //   print('onError on getErrorFuture() $error');
  // });
  // print('This line will executed');

  ///  3.3 `onError` with type cast
  /// 
  /// It will only catch error with specified type and else it will throw error 
  // await getSpecifiedErrorFuture().onError<SomeException>((error, stackTrace) {
  //   print('onError on getSpecifiedErrorFuture() $error');
  // });
  // print('This line will executed');
  // await getErrorFuture().onError<SomeException>((error, stackTrace) {
  //   print('onError on getSpecifiedErrorFuture() $error');
  // });
  // print('This line will not executed');

  /// 3.4 `catchError` - Future with catch error
  /// 
  /// It equivalent with try catch block
  // await getErrorFuture().catchError((object, stacktrace) {
  //   print('catchError on getErrorFuture() $object');
  //   print('Stacktrace $stacktrace');
  // });
  // print('This line will also got executed');

  // 3.5 `ignore` - will ignore error and will not break the code
  // Without ignore
  // await functionThatBreaks();
  // print('This will not executed');
  
  // With ignore
  functionThatBreaks().ignore();
  print('This will executed and program will not break');
}


/// Basic Future Function
Future<void> basicFuture() async {
  print('basicFuture STARTED');
  // Simulate wait for 2 second
  await Future.delayed(Duration(seconds: 2));
  print('basicFuture FINISHED');
}

Future<void> delayedFuture(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  print('This executed for $seconds second(s)');
}

/// Future with returned value
Future<int> getIntFuture(int value, {int seconds = 2}) async {
  await Future.delayed(Duration(seconds: seconds));
  return value;
}

/// Future with error
Future<void> getErrorFuture() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('getErrorFuture > throw error');
}

Future<void> getSpecifiedErrorFuture() async {
  await Future.delayed(Duration(seconds: 1));
  throw SomeException();
}

class SomeException implements Exception {
  const SomeException();

  @override
  String toString() {
    return 'SomeException';
  }
}

Future<void> functionThatBreaks() async {
  await getErrorFuture();
  print('Functions breaks here');
}