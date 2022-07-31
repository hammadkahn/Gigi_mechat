import 'package:flutter/material.dart';
import 'package:gigi_app/models/branch_model.dart';
import 'package:gigi_app/models/merchant_profile_model.dart';
import 'package:gigi_app/services/branch/branch_services.dart';
import 'package:gigi_app/services/get_profile/get_user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/auth/authentication.dart';

import '../../support/support.dart';
import '../authentication/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 51, right: 29, left: 29),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: FutureBuilder<ProfileModel>(
                      future: UserInformation()
                          .getMerchantInformation(widget.token),
                      builder: (context, snapshot) {
                        List<Widget> children;
                        if (snapshot.hasData) {
                          var data = snapshot.data!.data!;
                          children = <Widget>[
                            data.profilePicture == null ||
                                    data.profilePicture!.isEmpty
                                ? Image.asset('assets/images/kfc.png')
                                : Image.network(
                                    '${data.profilePicturePath}/${data.profilePicture}'),
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
                                'California, US\n${data.phone}  | ${data.email}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffC5C5C5))),
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
                        return Column(children: children);
                      },
                    ),
                  ),
                  const Spacer(),
                  const ListTile(
                    title: Text("Active Offers",
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff32324D))),
                  ),
                  ListTile(
                    onTap: () {
                      branches().whenComplete(() =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'number of branches: ${allBranches!.data!.length}'))));
                    },
                    leading: const Text("My Branches",
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff32324D))),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Support()));
                    },
                    title: const Text(
                      "Support",
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff32324D),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 200, bottom: 56, left: 15),
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
                                    builder: (_) => const auth_page()),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                          }
                        });
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Log out',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff9E9E9E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
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

  AllBranches? allBranches;

  Future<void> branches() async {
    final result = await BranchServices().getAllBranches(token: widget.token);
    allBranches = result;
    print(allBranches!.message);
  }
}
