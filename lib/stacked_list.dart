import 'package:flutter/material.dart';

class StackedList extends StatefulWidget {
  final double lineHeight;
  final Map<String, List> data;

  const StackedList({
    Key? key,
    required this.data,
    this.lineHeight = 80,
  }) : /*assert(titleBuilder != null),*/
        super(key: key);

  @override
  State<StackedList> createState() => _StackedListState();
}

class _StackedListState extends State<StackedList> {
  late List<bool> isClickedList;
  late List<String> titleList;
  late List<List<dynamic>> contentList;

  @override
  void initState() {
    titleList = widget.data.keys.toList();
    contentList = widget.data.values.toList();
    isClickedList = List.filled(titleList.length, false);
    super.initState();
  }

  void setClickList(int index) {
    setState(() {
      isClickedList[index] = !isClickedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          titleList.length,
          (titleIndex) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setClickList(titleIndex),
                      child: SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Align(
                          alignment: Alignment.center,
                          child: titleWidget(titleIndex),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      height: isClickedList[titleIndex]
                          ? widget.lineHeight * contentList[titleIndex].length
                          : widget.lineHeight,
                      child: Stack(
                        children: List.generate(
                          contentList[titleIndex].length,
                          (contentIndex) => AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            left: isClickedList[titleIndex]
                                ? 0
                                : contentIndex.toDouble() * 2,
                            top: isClickedList[titleIndex]
                                ? contentIndex.toDouble() * widget.lineHeight
                                : 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: myBox(
                                  contentList[titleIndex][contentIndex],
                                  widget.lineHeight),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
    );
  }

  Widget titleWidget(int titleIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.ac_unit),
        Text(
          ' ${titleList[titleIndex]}',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.ac_unit),
      ],
    );
  }

  Widget myBox(String s, double lineHeight) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: lineHeight - 6,
        decoration: BoxDecoration(
            border: Border.all(width: 1), color: const Color(0xffeff0f3)),
        child: Text(s));
  }
}
