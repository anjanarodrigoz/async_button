library async_button;

import 'package:flutter/material.dart';

class AsyncButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  final bool enable;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;

  const AsyncButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enable = true,
      this.color,
      this.icon,
      this.iconColor,
      this.iconSize = 25,
      this.width = 150.0,
      this.height = 40.0});

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  bool isProgressing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: isProgressing
          ? Material(
              color: widget.color ?? Colors.blue,
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: widget.height,
                width: widget.height,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.0,
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: () async {
                setState(() {
                  isProgressing = true;
                });

                await widget.onPressed();

                setState(() {
                  isProgressing = false;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                fixedSize: isProgressing
                    ? Size(widget.height, widget.height)
                    : Size(widget.width, widget.height),
                backgroundColor: widget.color ?? Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    Icon(
                      widget.icon,
                      color: widget.iconColor,
                      size: widget.iconSize,
                    ),
                  if (widget.icon != null)
                    const SizedBox(
                      width: 10.0,
                    ),
                  Text(widget.text),
                ],
              ),
            ),
    );
  }
}
