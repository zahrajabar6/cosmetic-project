import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Account {

  //final String token;
  final String firstName;
  final String lastname;
  final String email;
  final String? phone;
  final String? address;
  final String? token;

  Account( {
    required this.firstName,
    required this.lastname,
    this.token,
    required this.email,
    this.phone,
    this.address
});
  //static late Account currentAccount;
  static final currentAccount = Rxn<Account>();
}