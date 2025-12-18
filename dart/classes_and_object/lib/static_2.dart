class SomeClass {
    SomeClass(
      this.requiredValue,
    );
    final String requiredValue;

    static int counter = 0;
    void increment() {
        counter++;
    }

    int getCounter() {
      return counter;
    }
}
// Case 2
// With static
void main() {
    final classA = SomeClass('Some value');
    final classB = SomeClass('Another value');
    // Accessing value from class variable is not possible 
    //since now the counter variable is available at the class level
    // print('initial value classA = ${classA.counter}');
    print('initial value classA = ${classA.getCounter()}');
    print('initial value classB = ${classB.getCounter()}');
    classA.increment();
    
    print('classA value = ${classA.getCounter()}'); // result '1'
    print('classB value = ${classB.getCounter()}'); // result '1'
}