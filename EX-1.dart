enum Skill { FLUTTER, DART, OTHER }

class Employee {
  // Initialize Attributes
  String _name;
  double _baseSalary;
  List<Skill> _skill;
  Address _address;
  int _yearsOfExperience;

  // Assign Constructor
  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skill,
    required Address address,
    required int yearsOfExperience,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skill = skill,
       _address = address,
       _yearsOfExperience = yearsOfExperience;

  // Assigned Named Constructor
  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required List<Skill> skill,
    required Address address,
    required int yearsOfExperience,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skill = skill,
       _address = address,
       _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => computeSalary();
  List<Skill> get skill => _skill;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double totSalary = _baseSalary;
    totSalary += _yearsOfExperience * 2000;

    if (_skill.contains(Skill.FLUTTER)) {
      totSalary += 5000;
    } else if (_skill.contains(Skill.DART)) {
      totSalary += 3000;
    } else if (_skill.contains(Skill.OTHER)) {
      totSalary += 1000;
    } else {
      totSalary += 0;
    }
    return totSalary;
  }

  // Print details of employees informations
  void printDetails() {
    print("""
Employee: $name
Base Salary: \$${baseSalary}
Skill: $skill
Address: $address
YOE: $yearsOfExperience
    """);
  }
}

class Address {
  final String _street, _city;
  final int _zipCode;

  Address({required String street, required String city, required int zipCode})
    : _street = street,
      _city = city,
      _zipCode = zipCode;

  String get street => _street;
  String get city => _city;
  int get zipCode => _zipCode;

  @override
  String toString() {
    return """
Address:
  - Street: $street
  - City: $city
  - zipCode: $zipCode
""";
  }
}

void main() {
  var addr1 = Address(street: "001ABC", city: "Phnom Penh", zipCode: 0001);
  var emp1 = Employee(
    name: 'Sokea',
    baseSalary: 40000,
    skill: [Skill.FLUTTER, Skill.DART],
    address: addr1,
    yearsOfExperience: 100,
  );
  emp1.printDetails();
  emp1.computeSalary();
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    name: 'Ronan TheBest',
    baseSalary: 40000,
    skill: [Skill.DART, Skill.FLUTTER],
    address: addr1,
    yearsOfExperience: 50,
  );
  emp2.computeSalary();
  emp2.printDetails();
}