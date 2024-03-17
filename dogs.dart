import 'dart:io';

// Define an interface
abstract class Animal {
  void makeSound();
}

// Base class implementing Animal interface
class Mammal implements Animal {
  @override
  void makeSound() {
    print('Mammal makes a sound');
  }
}

// Subclass inheriting from Mammal
class Dog extends Mammal {
  @override
  void makeSound() {
    print('Dog barks');
  }

  void fetch() {
    print('Dog is fetching...');
  }
}

// Class that reads data from a file and initializes Dog instances
class DogLoader {
  List<Dog> loadDogsFromFile(String filePath) {
    var file = File(filePath);
    var lines = file.readAsLinesSync();
    var dogs = <Dog>[];
    for (var line in lines) {
      var parts = line.split(',');
      if (parts.length == 2) {
        var name = parts[0];
        var breed = parts[1];
        dogs.add(Dog(name, breed));
      }
    }
    return dogs;
  }
}

void main() {
  // Demonstrate inheritance and method overriding
  var dog = Dog();
  dog.makeSound(); // Output: Dog barks

  // Demonstrate interface implementation
  var mammal = Mammal();
  mammal.makeSound(); // Output: Mammal makes a sound

  // Initialize Dog instances from a file
  var dogLoader = DogLoader();
  var dogs = dogLoader.loadDogsFromFile('dogs.txt');
  for (var dog in dogs) {
    print('Loaded dog: ${dog.name}, ${dog.breed}');
  }

  // Demonstrate the use of a loop
  for (var i = 0; i < 3; i++) {
    print('Loop iteration: $i');
  }
}
