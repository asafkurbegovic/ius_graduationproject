class Person {
  String? FirstName, LastName, Email, Password;
  String? BirthDate;
  int? Id;

  Person(){}

  Person.fromJson(Map<String, dynamic> json)
      : FirstName = json['first_name'] as String,
        LastName = json['last_name'] as String,
        Password = json['password'] as String,
        Email = json['email'] as String,
        BirthDate = json['birth_date'] as String,
        Id = json['id'] as int;

  Map<String, dynamic> toJson() => {
    'FirstName': FirstName,
    'Email': Email,
    'LastName': LastName,
    'Password': Password,
    'BirthDate': BirthDate,
  };

  // Person(this.FirstName, this.LastName, this.Email, this.BirthDate, this.Password);
}