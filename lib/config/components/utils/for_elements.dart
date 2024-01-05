import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget forElements(List<String>? elements, String svgImg) {
  if (elements != null) {
    return Column(
      children: [
        for (var element in elements)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: element.isNotEmpty
                ? Row(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/$svgImg',
                            height: 24,
                            // width: 18,
                          ),
                          const Positioned(
                            top: 0.5,
                            right: 0,
                            child: Icon(Icons.watch_later_outlined, size: 6),
                          )
                        ],
                      ),
                      const SizedBox(width: 2),
                      Text(
                        element,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : null,
          ),
      ],
    );
  } else {
    return Container();
  }
}
