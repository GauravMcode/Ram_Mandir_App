import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:page_flip/page_flip.dart';
import 'package:ram_mandir_app/data/app_data/events.dart';
import 'package:ram_mandir_app/presentation/widgets/bottom_image.dart';
import 'package:ram_mandir_app/presentation/widgets/last_page.dart';
import 'package:ram_mandir_app/presentation/widgets/middle_text_widget.dart';
import 'package:ram_mandir_app/presentation/widgets/progress_bar.dart';
import 'package:size_config/size_config.dart';

// the first page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //flutter toast
    Fluttertoast.showToast(
        msg: "Swipe Screen Left to view more",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    super.initState();
  }

  final _controller = GlobalKey<PageFlipWidgetState>();
  int currentEvent = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/music");
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.music_note,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: PageFlipWidget(
          key: _controller,
          lastPage: const LastPage(),
          children: List.generate(events.length, (index) {
            currentEvent = index - 1;
            return LayoutBuilder(builder: (context, constraints) {
              return DecoratedBox(
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/ram_bg.jpg"), fit: BoxFit.fill)),
                child: GlassmorphicContainer(
                  borderRadius: 2,
                  blur: 5,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                    const Color(0xFFffffff).withOpacity(0.1),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ], stops: const [
                    0.1,
                    1,
                  ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Column(
                              children: [
                                SizedBox(height: 80.h),
                                ProgressBar(
                                  index: index + 1,
                                  constraints: constraints,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -20.h,
                            left: index == 0 ? currentEvent * (constraints.maxWidth * 0.3 / events.length) : currentEvent * (constraints.maxWidth * 0.3 / events.length),
                            child: Image.asset(
                              "assets/images/bhagwa.png",
                              width: 150.w,
                              height: 120.h,
                            ),
                          )
                        ],
                      ),
                      MiddleText(index: index),
                      BottomImage(index: index),
                    ],
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
