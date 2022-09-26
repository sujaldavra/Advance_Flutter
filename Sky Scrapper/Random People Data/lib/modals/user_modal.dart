class UserDetails {
  final String title;
  final String firstName;
  final String lastName;
  final String gender;
  final String address;
  final String email;
  final String userName;
  final String image;
  final int age;
  final String phone;

  UserDetails({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.address,
    required this.email,
    required this.userName,
    required this.image,
    required this.age,
    required this.phone,
  });

  factory UserDetails.fromJSON({required Map<String, dynamic> json}) {
    return UserDetails(
      title: json["results"][0]["name"]["title"],
      firstName: json["results"][0]["name"]["first"],
      lastName: json["results"][0]["name"]["last"],
      gender: json["results"][0]["gender"],
      address:
          "${json["results"][0]["location"]["street"]["number"]}, ${json["results"][0]["location"]["street"]["name"]}, ${json["results"][0]["location"]["city"]}, ${json["results"][0]["location"]["state"]}, ${json["results"][0]["location"]["country"]} - ${json["results"][0]["location"]["postcode"]}",
      email: json["results"][0]["email"],
      userName: json["results"][0]["login"]["username"],
      image: json["results"][0]["picture"]["large"],
      age: json["results"][0]["dob"]["age"],
      phone: json["results"][0]["phone"],
    );
  }
}
