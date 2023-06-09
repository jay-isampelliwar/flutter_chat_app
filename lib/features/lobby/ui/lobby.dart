import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_test/core/constant/app_color.dart';
import 'package:socket_io_test/core/constant/app_helper.dart';
import 'package:socket_io_test/core/constant/app_text_styles.dart';
import 'package:socket_io_test/core/constant/const_size_box.dart';
import 'package:socket_io_test/locator.dart';

import '../../chat/ui/chat.dart';
import '../bloc/lobby_bloc.dart';

class Lobby extends StatelessWidget {
  Lobby({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LobbyBloc, LobbyState>(
      bloc: locator.get<LobbyBloc>(),
      listener: (context, state) {
        if (state is LobbyChatNavigatorActionState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Chat(
                name: state.name,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.1,
                right: size.width * 0.1,
              ),
              child: Column(
                children: [
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: AppColor.userMessageCardColor,
                          controller: nameTextEditingController,
                          decoration: InputDecoration(
                            border: textFieldBorder(size),
                            focusedBorder: textFieldBorder(size),
                            label: Text(
                              "Name",
                              style:
                                  AppTextStyles.text18(bold: false, size: size)
                                      .copyWith(
                                          color: AppColor.userMessageCardColor),
                            ),
                          ),
                          validator: (value) => Helper.isValidName(value!),
                        ),
                        AppConstSizedBox.height(size.height * 0.04),
                        GestureDetector(
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              locator.get<LobbyBloc>().add(
                                    LobbyChatNavigatorActionEvent(
                                      name: nameTextEditingController.text,
                                    ),
                                  );
                            }
                          },
                          child: Container(
                            height: size.height * 0.07,
                            decoration: BoxDecoration(
                              color: AppColor.friendMessageCardColor,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.03),
                            ),
                            child: Align(
                              child: Text(
                                "Done",
                                style:
                                    AppTextStyles.text22(bold: true, size: size)
                                        .copyWith(
                                  color: AppColor.userMessageColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder(Size size) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.friendMessageCardColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(size.width * 0.03));
  }
}
