class Account {

  //final String token;
  final String firstName;
  final String lastname;
  final String email;
  final String? phone;
  final String? address;

  Account( {
    required this.firstName,
    required this.lastname,
    //required this.token,

    required this.email,
     this.phone,
     this.address
});
  static late Account currentAccount;
}