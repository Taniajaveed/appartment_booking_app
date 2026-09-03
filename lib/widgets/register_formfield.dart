import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterBox extends StatelessWidget {
  final String text;
  final String hintnote;
  final bool isPassword;
  final bool isEmail;
  final void Function(String?)? onSaved;

  RegisterBox({
    required this.text,
    required this.hintnote,
    this.isPassword = false,
    this.isEmail = false,
    this.onSaved,
  });
  final isObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      margin: const EdgeInsets.only(left: 27, right: 27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              //widget.text,
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          Container(
            width: 376,
            height: 56,
            decoration: BoxDecoration(),
            child: TextFormField(
              onSaved: onSaved,
              validator: (value) {
                // Empty field validation
                if (value == null || value.isEmpty) {
                  return 'Please enter ${text}';
                }

                if (isEmail) {
                  if (!GetUtils.isEmail(value)) {
                    return 'Enter a valid email address';
                  }
                }

                // Password validation
                if (isPassword) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                }
                return null;
              },
              keyboardType: isEmail
                  ? TextInputType.emailAddress
                  : TextInputType.text,
              textAlign: TextAlign.start,
              obscureText: isPassword ? isObscure.value : false,

              decoration: InputDecoration(
                //border: InputBorder.none,
                border: InputBorder.none,

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                hintText: hintnote,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB3B3B3),
                ),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1F222B)
                    : const Color.fromARGB(255, 234, 233, 233),

                suffixIcon: isPassword
                    ? Obx(
                        () => IconButton(
                          onPressed: () {
                            isObscure.value = !isObscure.value;
                          },
                          icon: Icon(
                            isObscure.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xffE1E1E1),
                            size: 20,
                          ),
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Color(0xffE5E5E5),
                    width: 1,
                  ),
                ),
                // Border when clicked/focused
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Color(0xff6C63FF),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
