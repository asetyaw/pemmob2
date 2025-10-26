// === VARIABLES ===
// Numbers
void numbersExample() {
  int age = 25; // Integer: whole number
  double height = 175.5; // Double: number with a fraction
  print('Age: $age, Height: $height');
}

// Strings
void stringsExample() {
  String name = 'Alice'; // Defined with single or double quotes
  print('Hello, $name!');
}

// Booleans
void booleansExample() {
  bool isStudent = true;
  print('Is student: $isStudent');
}

// Sets
void setsExample() {
  Set<String> fruits = {'apple', 'banana', 'apple'}; // Duplicates are ignored
  print('Fruits: $fruits');
}

// Lists
void listsExample() {
  List<int> scores = [85, 90, 95]; // A list of integers
  print('Scores: $scores');
}

// Maps
void mapsExample() {
  Map<String, int> ages = {'Alice': 25, 'Bob': 30}; // Key/value pairs
  print('Bob\'s age: ${ages['Bob']}');
}

// Null Safety
void nullSafetyExample() {
  String? nickname = null; // The ? allows null values
  print('Nickname: $nickname');
  print('Fallback: ${nickname ?? "Guest"}'); // Use ?? to provide fallback
}

// Records
void recordsExample() {
  var person = ('Alice', 25); // Record with two values
  print('Name: ${person.$1}, Age: ${person.$2}');
}

// === CONTROL FLOW ===
// If statement
void ifExample() {
  int score = 85;
  if (score >= 90) {
    print('Excellent!');
  } else if (score >= 70) {
    print('Good job!');
  } else {
    print('Keep practicing!');
  }
}

// Switch statement
void switchExample() {
  var type = 'File';
  switch (type) {
    case 'File':
      print('The type is a File');
      break;
    case 'Directory':
      print('The type is a Directory');
      break;
    case 'Image':
      print('The type is an Image');
      break;
    default:
      print('Unknown type');
  }
}

// For loop
void forExample() {
  for (var counter = 0; counter < 5; counter++) {
    print('Counter is $counter');
  }
  
  List<String> fruits = ['apple', 'banana', 'orange'];
  for (String fruit in fruits) {
    print(fruit);
  }
}

// While loop
void whileExample() {
  int count = 1;
  while (count <= 5) {
    print('Count: $count');
    count++; // increase the value each time
  }
}

// Do-While loop
void doWhileExample() {
  int number = 10;
  do {
    print('Number: $number');
    number--;
  } while (number >= 5);
}

// Break and Continue
void breakContinueExample() {
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print('Skip number 5 (using continue)');
      continue; // skip this iteration
    }
    if (i == 8) {
      print('Stop loop at number 8 (using break)');
      break; // stop the loop completely
    }
    print('Number: $i');
  }
}

// === FUNCTIONS ===
// Main function
void main() {
  print('Hello Dart!');
  
  // Run variable examples
  numbersExample();
  stringsExample();
  booleansExample();
  setsExample();
  listsExample();
  mapsExample();
  nullSafetyExample();
  recordsExample();
  
  // Run control flow examples
  ifExample();
  switchExample();
  forExample();
  whileExample();
  doWhileExample();
  breakContinueExample();
  
  // Function examples
  greetUser('Andri');
  var welcomeMessage = getWelcomeMessage('Andri');
  print('Welcome Message: $welcomeMessage');
  var circleArea = calculateCircleArea(5);
  print('Circle Area: $circleArea');
}

// Normal function examples
void greetUser(String name) {
  print('Hello, $name! Welcome to Dart programming.');
}

String getWelcomeMessage(String name) {
  return 'Welcome, $name! Have a great day.';
}

double calculateCircleArea(double radius) {
  const double pi = 3.14159;
  return pi * radius * radius;
}

// === OOP (Object Oriented Programming) ===
class Person {
  // Properties (fields)
  String name;
  int _age; // private field (starts with underscore)
  
  // Constructor
  Person(this.name, this._age);
  
  // Getter
  int get age => _age;
  
  // Setter
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print('Age must be positive!');
    }
  }
  
  // Method
  void sayHello() {
    print('Hello, my name is $name and I am $_age years old.');
  }
}

class Student extends Person {
  String major;
  
  // Constructor using super to call parent class constructor
  Student(String name, int age, this.major) : super(name, age);
  
  // Overriding method from Person class
  @override
  void sayHello() {
    print('Hi! I\'m $name, a student majoring in $major.');
  }
  
  // Additional method only for Student
  void study() {
    print('$name is studying $major.');
  }
}

void oopExample() {
  // Create an object (instance) of the class
  Person person1 = Person('Alice', 25);
  person1.sayHello();
  
  // Change property value using setter
  person1.age = 26;
  
  // Get property value using getter
  print('Updated Age: ${person1.age}');
  
  // Example of inheritance
  Student student = Student('Charlie', 20, 'Computer Science');
  student.sayHello();
  student.study();
}

// === EXTENSIONS ===
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

void extensionsExample() {
  print('92'.parseInt()); // Output: 92
}

// === CONCURRENCY ===
Future<String> fetchData() async {
  // Simulate a network request
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched successfully';
}

void concurrencyExample() async {
  print('Fetching data...');
  String result = await fetchData();
  print(result);
}

// === EXCEPTIONS ===
class Simple {
  final String name;
  int? id;
  
  Simple({required this.name, this.id});
  
  void throwException() {
    throw Exception('This is an exception');
  }
  
  void printName() {
    if (id != null) {
      print('Name is $name with id: $id');
    } else {
      print('Name is $name');
    }
  }
}

void exceptionsExample() {
  final simple = Simple(name: 'Simple');
  try {
    simple.printName();
    simple.throwException();
  } catch (exception) {
    print('Exception Thrown: $exception');
  } finally {
    print('Exception handling completed');
  }
}