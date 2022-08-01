import 'package:flutter/material.dart';

import '../models/branch_model.dart';
import '../services/branch/branch_services.dart';

class MyBranches extends StatelessWidget {
  const MyBranches({Key? key, required this.token, required this.title})
      : super(key: key);
  final String token;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: FutureBuilder<AllBranches>(
          future: BranchServices().getAllBranches(token: token),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.data!.data!.isEmpty) {
                  return const Center(child: Text('No deals available'));
                } else {
                  print(snapshot.data!.data!.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.data![index];
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(data.name!),
                          subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.description ?? 'no description'),
                                Text(data.address ?? 'no address'),
                                Text(data.country ?? 'country not specified'),
                                Divider(
                                  thickness: 0.5,
                                  height: 1,
                                  color: Colors.grey[350],
                                )
                              ]),
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
