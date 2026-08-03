import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'GetAllUserProvider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),

      body: users.when(

        data: (data) {

          return ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {

              final user = data[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(
                        "${user.name?.firstname} ${user.name?.lastname}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text("Email : ${user.email}"),

                      Text("Username : ${user.username}"),

                      Text("Phone : ${user.phone}"),

                      const Divider(),

                      Text("City : ${user.address?.city}"),

                      Text("Street : ${user.address?.street}"),

                      Text("Zip Code : ${user.address?.zipcode}"),

                      Text(
                        "Location : ${user.address?.geolocation?.lat}, ${user.address?.geolocation?.long}",
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },

        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, s) => Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}