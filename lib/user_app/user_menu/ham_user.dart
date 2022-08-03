import 'package:flutter/material.dart';
import 'package:gigi_app/models/user_model.dart';
import 'package:gigi_app/services/auth/authentication.dart';
import 'package:gigi_app/services/get_profile/get_user_info.dart';
import 'package:gigi_app/user_app/user_auth/user_auth.dart';
import 'package:gigi_app/user_app/user_menu/support_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ham_user extends StatefulWidget {
  const ham_user({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<ham_user> createState() => _ham_userState();
}

class _ham_userState extends State<ham_user> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xffFCFCFC),
            Color(0xffF7F7F7),
            Color(0xffF7F7F7),
            Color(0xffF7F7F7),
            Color(0xffFCFCFC)
          ])),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 29, left: 29),
                    child: SingleChildScrollView(
                        child: FutureBuilder<UserProfileModel>(
                      future: UserInformation().getUserProfile(widget.token),
                      builder: ((context, snapshot) {
                        List<Widget> children;

                        if (snapshot.hasData) {
                          var data = snapshot.data!.data!;
                          children = [
                            data.profilePicture == null ||
                                    data.profilePicture!.isEmpty
                                ? Image.asset(
                                    'assets/images/slt.png',
                                    height: 100,
                                    width: 100,
                                  )
                                : Image.network(
                                    '${data.profilePicturePath}/${data.profilePicture}',
                                    height: 100,
                                    width: 100,
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 10),
                              child: Text(data.name!,
                                  style: const TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff32324D))),
                            ),
                            Text(
                                'California, US\n${data.phone!}  |   ${data.email}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffC5C5C5))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 22, bottom: 25),
                                    child: Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 0.5,
                                      // height: 214,
                                      indent: 82,
                                      endIndent: 79,
                                    )),
                                InkWell(
                                  onTap: () {},
                                  child: const Text("My Offers",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff32324D))),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 18, bottom: 18),
                                  child: Divider(
                                    color: Color(0xFFE6E6E6),
                                    thickness: 0.5,
                                    // height: 214,
                                    indent: 26,
                                    endIndent: 26,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      data.perference!.isNotEmpty
                                          ? data.perference![0].categoryName!
                                          : 'no preferences added yet',
                                    )));
                                  },
                                  child: const Text("My Prefrences",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff32324D))),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 18, bottom: 18),
                                    child: Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 0.5,
                                      // height: 214,
                                      indent: 26,
                                      endIndent: 26,
                                    )),
                                InkWell(
                                  onTap: () {
                                    alertBox(data, context);
                                  },
                                  child: const Text("My Account",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff32324D))),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 18, bottom: 18),
                                    child: Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 0.5,
                                      // height: 214,
                                      indent: 26,
                                      endIndent: 26,
                                    )),
                                const Text("My Insights",
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff32324D))),
                                const Padding(
                                    padding:
                                        EdgeInsets.only(top: 18, bottom: 18),
                                    child: Divider(
                                      color: Color(0xFFE6E6E6),
                                      thickness: 0.5,
                                      // height: 214,
                                      indent: 26,
                                      endIndent: 26,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => support_user(
                                          phoneNumber: data.phone!,
                                          token: widget.token,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Support",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff32324D))),
                                ),
                              ],
                            ),
                          ];
                        } else if (snapshot.hasError) {
                          children = <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'),
                            )
                          ];
                        } else {
                          children = const <Widget>[
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ];
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children,
                        );
                      }),
                    )),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 35, top: 100, bottom: 56),
                      child: GestureDetector(
                        onTap: () {
                          MerchantAuthServices()
                              .logOut(widget.token)
                              .then((value) {
                            if (value == 'success') {
                              isLogOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const user_auth()),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value)));
                            }
                          });
                        },
                        child: const Text('Log out',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff9E9E9E))),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> isLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void alertBox(UserProfileData userProfileData, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '${userProfileData.name!}\'s Profile',
              textAlign: TextAlign.center,
            ),
            content: Column(children: [
              ListTile(
                  leading: const Icon(Icons.person, size: 20),
                  title: Text(userProfileData.name!)),
              ListTile(
                  leading: const Icon(Icons.email, size: 20),
                  title: Text(userProfileData.email!)),
              ListTile(
                  leading: const Icon(Icons.male, size: 20),
                  title: Text(userProfileData.gender!)),
              ListTile(
                  leading: const Icon(Icons.phone, size: 20),
                  title: Text(userProfileData.phone!)),
              ListTile(
                  leading: const Icon(Icons.person, size: 20),
                  title: Text(userProfileData.age!)),
            ]),
          );
        });
  }
}
