import 'package:flutter/material.dart';

class ProductSample extends StatelessWidget {
  const ProductSample({super.key, this.name, this.color, this.capacity});
  final String? name;
  final String? color;
  final String? capacity;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/Maps.png",
              width: width * .15,
              height: height * .15,
            ),
          ),

          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            name ?? "Dummy",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter_Regular",
              color: Colors.black,
            ),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            color ?? "Dummy ",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Inter_Regular",
              color: Colors.black.withOpacity(.5),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                capacity ?? "Dummy ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter_Regular",
                  color: Colors.black,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(child: Icon(Icons.add, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
