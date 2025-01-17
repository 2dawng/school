class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        pass


class Cat(Animal):
    def speak(self):
        return "Meow!"


class Dog(Animal):
    def speak(self):
        return "Woof!"


a = Cat("Kitty")
b = Dog("Rover")
print(a.speak())
print(b.speak())
