class SomeClass {
    SomeClass(
      this.requiredValue,
    );
    final String requiredValue;

    int counter = 0;
    void increment() {
        counter++;
    }
}

// Case 1
// Without using static
void main() {
     
    final classA = SomeClass('Some value');
    final classB = SomeClass('Another value');
    // Me accessing the value from the class
    print('initial value classA = ${classA.counter}');
    print('initial value classB = ${classB.counter}');

    classA.increment();

    print('classA value = ${classA.counter}'); // result 1
    print('classB value = ${classB.counter}'); // result 0
}