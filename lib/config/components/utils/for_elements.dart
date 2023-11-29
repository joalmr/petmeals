import 'package:flutter/material.dart';

Widget forElements(List<String>? elements) {
  if (elements != null) {
    return Column(
      children: [
        for (var element in elements)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: element.isNotEmpty
                ? Row(
                    children: [
                      const Icon(Icons.watch_later_outlined, size: 16),
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
