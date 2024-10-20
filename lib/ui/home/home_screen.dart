import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gemini_tut_app/bloc/home_bloc/home_bloc.dart';
import 'package:gemini_tut_app/models/gpt_body_model.dart';
import 'package:gemini_tut_app/models/gpt_response_model.dart';
import 'package:gemini_tut_app/ui/home/components/bot_mes_box.dart';
import 'package:gemini_tut_app/ui/home/components/bot_mes_loading.dart';
import 'package:gemini_tut_app/ui/home/components/sender_mes_box.dart';
import 'package:gemini_tut_app/ui/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Talk Sh!t'),
          leadingWidth: 46,
          leading: Image.asset('assets/logos/splash_logo.png'),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listener: (context, state) async {
            await Future.delayed(const Duration(milliseconds: 100));
            Provider.of<HomeProvider>(context, listen: false).scrollToBottom();
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case ChatSuccessState:
                {
                  List<Contents> chatContent =
                      (state as ChatSuccessState).content;

                  return Consumer<HomeProvider>(
                    builder: (context, value, child) => Stack(
                      children: [
                        if (chatContent.isEmpty)
                          Center(
                            child: Text(
                              'Seedhi Baat  No Bakwaas !',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 19),
                            ),
                          ),
                        Column(
                          children: [
                            Expanded(
                                flex: 10,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: RangeMaintainingScrollPhysics(),
                                  controller: value.scrollController,
                                  itemBuilder: (context, index) {
                                    if (index ==
                                            (state as ChatSuccessState)
                                                .content
                                                .length &&
                                        (state as ChatSuccessState).isLoading) {
                                      return const BotMesLoading();
                                    }
                                    if (index ==
                                        (state as ChatSuccessState)
                                            .content
                                            .length) {
                                      return Container();
                                    }
                                    if (chatContent[index].role.toString() ==
                                        "user") {
                                      return SenderMesBox(
                                          messageText: chatContent[index]
                                              .parts
                                              ?.first
                                              .text
                                              .toString());
                                    } else if (chatContent[index]
                                            .role
                                            .toString() ==
                                        "model") {
                                      return BotMesBox(
                                          messageText: chatContent[index]
                                              .parts
                                              ?.first
                                              .text
                                              .toString());
                                    } else {
                                      return Container();
                                    }
                                  },
                                  itemCount: chatContent.length + 1,
                                )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: value.textController,
                                          cursorHeight: 16,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                              hintText: 'Message',
                                              fillColor: Colors.grey.shade800,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100))),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // value.addResponse();
                                          if (value
                                                  .textController.text.length ==
                                              0) return;

                                          // Using Provider
                                          // HomeRepo(Dio()).chatTextGeneration([
                                          //   Contents(parts: [
                                          //     Parts(
                                          //         text: value.textController.text.toString())
                                          //   ], role: "user")
                                          // ]);

                                          // Using Bloc
                                          homeBloc.add(
                                              ChatGenerateNewTextMessageEvent(
                                                  inputMessage: value
                                                      .textController.text
                                                      .toString()));

                                          value.textController.clear();

                                          // await Future.delayed(const Duration(
                                          // milliseconds: 100));
                                          // value.scrollToBottom();
                                        },
                                        child: const CircleAvatar(
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.black,
                                          ),
                                          radius: 26,
                                          backgroundColor: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }

              default:
                {
                  return const SizedBox();
                }
            }
          },
        ));
  }
}
