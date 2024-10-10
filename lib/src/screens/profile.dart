import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? profileData;
  String? formattedDob;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      setState(() {
        profileData = jsonDecode(response.body)['results'][0];
        String dobString = profileData?['dob']['date'];
        DateTime dobDateTime = DateTime.parse(dobString);
        formattedDob = DateFormat('MMMM dd, yyyy').format(dobDateTime);
      });
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF6218AB),
        child: profileData == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Icon(
                            Icons.logout,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 100,
                            left: 0,
                            right: 0,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      '${profileData!['name']['title']}. ${profileData!['name']['first']} ${profileData!['name']['last']}',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Contact Details',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    IconTextPair(
                                        icon: Icons.email,
                                        text: '${profileData!['email']}'),
                                    IconTextPair(
                                        icon: Icons.phone,
                                        text: '${profileData!['phone']}'),
                                    IconTextPair(
                                        icon: Icons.phone_android,
                                        text: '${profileData!['cell']}'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Personal Details',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    IconTextPair(
                                        icon: Icons.calendar_today,
                                        text:
                                            '$formattedDob | ${profileData!['dob']['age']} years old'),
                                    IconTextPair(
                                        icon: profileData!['gender'] == 'male'
                                            ? Icons.male
                                            : profileData!['gender'] == 'female'
                                                ? Icons.female
                                                : Icons.person,
                                        text: '${profileData!['gender']}'),
                                    IconTextPair(
                                        icon: Icons.location_on,
                                        text:
                                            '${profileData!['location']['street']['number']} ${profileData!['location']['street']['name']}, ${profileData!['location']['city']},  ${profileData!['location']['state']}, ${profileData!['location']['country']}, ${profileData!['location']['postcode']}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFF6218AB),
                                  width: 10,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                    profileData!['picture']['large']),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class IconTextPair extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextPair({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(text,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        )
      ],
    );
  }
}
