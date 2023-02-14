import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading..."),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}