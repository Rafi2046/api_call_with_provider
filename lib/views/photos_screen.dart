import 'package:api_call_with_provider/core/provider/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:api_call_with_provider/core/provider/photo_provider.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: ChangeNotifierProvider(
          create: (context) => PhotoProvider(),
          child: Consumer<PhotoProvider>(
            builder: (context, provider, _) {
              final data = provider.photoResponse;
              print(data);
              return Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'Photos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                      ),
                      itemCount: data.length ?? 0,
                      itemBuilder: (context, index) {
                        final photo = data[index];
                        return Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkNQw7GCBBS1Jht_56B9wAPlMwTZi4i4Bkgg&s"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ID: ${photo.id ?? ""}",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "title: ${photo.title}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
