
class Employee {
  String? UserId;
  final String email;
  final String password;
  final String name;
  final String phone;


  Employee(
      {
      required this.email,
      required this.password,
      required this.name,
      required this.phone,
       });

  Map<String, dynamic> toEmployee() => {
    'name':name,
    'phone':phone,

  };

  Map<String, dynamic> toUser() => {
    'email': email,
    'role': 'Gallia',
  };
}
