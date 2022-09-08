class User {
  final String name;
  final String phone;
  final String gender;
  final String company;
  final String email;

  const User(this.name, this.phone, this.gender, this.company, this.email);
}

final List<User> users = _user.map((e) => User(e['name'] as String, e['phone'] as String, e['gender'] as String, e['company'] as String, e['email'] as String)).toList();

final List<Map<String, Object>> _user = [
  {
    "_id": "631957215ae217d3958c66c6",
    "name": "Paulette Long",
    "gender": "female",
    "company": "PANZENT",
    "email": "paulettelong@panzent.com",
    "phone": "+1 (810) 402-3889"
  },
  {
    "_id": "63195721d0f5ccdc2947878e",
    "name": "Hogan Sullivan",
    "gender": "male",
    "company": "EXOSPEED",
    "email": "hogansullivan@exospeed.com",
    "phone": "+1 (973) 420-2386"
  },
  {
    "_id": "631957219a8d9907a5aba7a7",
    "name": "Avery Rasmussen",
    "gender": "male",
    "company": "FUTURIS",
    "email": "averyrasmussen@futuris.com",
    "phone": "+1 (980) 489-2248"
  },
  {
    "_id": "63195721bc883fddbe764bc5",
    "name": "George Smith",
    "gender": "male",
    "company": "SENSATE",
    "email": "georgesmith@sensate.com",
    "phone": "+1 (978) 514-3598"
  },
  {
    "_id": "631957216b9113ce5c99fc44",
    "name": "Susan Carey",
    "gender": "female",
    "company": "SULFAX",
    "email": "susancarey@sulfax.com",
    "phone": "+1 (916) 566-3348"
  },
  {
    "_id": "631957219c4e29ce7d2d1245",
    "name": "Willie Dennis",
    "gender": "female",
    "company": "INTRADISK",
    "email": "williedennis@intradisk.com",
    "phone": "+1 (989) 442-2176"
  },
  {
    "_id": "63195721058f26e36ea292e1",
    "name": "Chrystal Ramsey",
    "gender": "female",
    "company": "SIGNIDYNE",
    "email": "chrystalramsey@signidyne.com",
    "phone": "+1 (819) 465-2297"
  },
  {
    "_id": "63195721b036a3f89014096a",
    "name": "Patrice Ruiz",
    "gender": "female",
    "company": "PROSELY",
    "email": "patriceruiz@prosely.com",
    "phone": "+1 (935) 586-2882"
  },
  {
    "_id": "63195721960508ee9a7cbdda",
    "name": "Rollins Booker",
    "gender": "male",
    "company": "EQUITAX",
    "email": "rollinsbooker@equitax.com",
    "phone": "+1 (806) 569-2967"
  }
];