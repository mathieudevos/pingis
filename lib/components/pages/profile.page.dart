import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pingis/state/services/auth.service.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const verticalOffset = 12.0;
    const inbetweenOffset = 3.0;
    final textTheme = Theme.of(context).textTheme;
    final user = Provider.of<AuthService>(context).user;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, 5),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(0, -5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.center,
                        child: user.photoURL != null
                          ? CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(user.photoURL),
                          )
                          : CircleAvatar(
                            radius: 30,
                            child: Text(user.initials),
                          ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, verticalOffset, 0, inbetweenOffset),
                            child: const Text(
                              'Username:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: inbetweenOffset),
                            child: const Text(
                              'Email:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: inbetweenOffset),
                            child: const Text(
                              'Games played:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, inbetweenOffset, 0, verticalOffset),
                            child: Text(
                              'Current ELO:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, verticalOffset, 0, inbetweenOffset),
                            child: Text(
                              user.displayName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: inbetweenOffset),
                            child: Text(
                              user.email,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: inbetweenOffset),
                            child: Text(
                              user.gamesPlayed.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, inbetweenOffset, 0, verticalOffset),
                            child: Text(
                              user.eloRating.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}