library flutter_web_pagination;

import 'dart:math';

import 'package:flutter/material.dart';

import '../AppConst.dart';

class WebPagination extends StatefulWidget {
  final int currentPage;
  final int totalPage;
  final ValueChanged<int> onPageChanged;
  final int displayItemCount;
  const WebPagination(
      {Key? key,
        required this.onPageChanged,
        required this.currentPage,
        required this.totalPage,
        this.displayItemCount = 11})
      : super(key: key);

  @override
  _WebPaginationState createState() => _WebPaginationState();
}

class _WebPaginationState extends State<WebPagination> {
  late int currentPage = widget.currentPage;
  late int totalPage = widget.totalPage;
  late int displayItemCount = widget.displayItemCount;
  late TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(covariant WebPagination oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPage != widget.currentPage ||
        oldWidget.totalPage != widget.totalPage) {
      setState(() {
        currentPage = widget.currentPage;
        totalPage = widget.totalPage;
      });
    }
  }

  void _updatePage(int page) {
    setState(() {
      currentPage = page;
    });
    widget.onPageChanged(page);
  }

  List<Widget> _buildPageItemList() {
    List<Widget> widgetList = [];
    widgetList.add(_PageControlButton(
      enable: currentPage > 1,
      title:  Icon(
        size:14,
        Icons.arrow_back_ios_new_sharp,
        color: AppColors.iconPurpleColor,
      ),
      onTap: () {
        _updatePage(currentPage - 1);
      },
    ));

    var leftPageItemCount = (displayItemCount / 2).floor();

    var rightPageItemCount = max(0, displayItemCount - leftPageItemCount - 1);

    int startPage = max(
        1,
        currentPage -
            max(leftPageItemCount,
                (displayItemCount - totalPage + currentPage - 1)));

    for (; startPage <= currentPage; startPage++) {
      widgetList.add(_PageItem(
        page: startPage,
        isChecked: startPage == currentPage,
        onTap: (page) {
          _updatePage(page);
        },
      ));
    }

    int endPage =
    min(totalPage, max(displayItemCount, currentPage + rightPageItemCount));

    for (; startPage <= endPage; startPage++) {
      widgetList.add(_PageItem(
        page: startPage,
        isChecked: startPage == currentPage,
        onTap: (page) {
          _updatePage(page);
        },
      ));
    }

    widgetList.add(_PageControlButton(
      enable: currentPage < totalPage,
      title:  Icon(
        size:14,
        Icons.arrow_forward_ios_sharp,
        color: AppColors.iconPurpleColor,
      ),
      onTap: () {
        _updatePage(currentPage + 1);
      },
    ));
    return widgetList;
  }

  Widget _buildPageInput() {
    return Container(
        height: 40,
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: const Color(0xFFE3E3E3), width: 1)),
        width: 50,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          maxLines: 1,
          inputFormatters: CustomTextInputFormatter.getIntFormatter(
              maxValue: totalPage.toDouble()),
          style: const TextStyle(
              textBaseline: TextBaseline.alphabetic,
              color: Color(0xFF0175C2),
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: totalPage.toString(),
              hintStyle: const TextStyle(
                  color: Color(0xFFA3A3A3),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._buildPageItemList(),
        const SizedBox(width: 10),
        // _buildPageInput(),
        // const SizedBox(width: 10),
        // _PageControlButton(
        //     enable: true,
        //     title: "GO",
        //     onTap: () {
        //       setState(() {
        //         try {
        //           _updatePage(int.parse(controller.text));
        //           controller.clear();
        //         } catch (e) {
        //           // print(e);
        //         }
        //       });
        //     })
      ],
    );
  }
}

class _PageControlButton extends StatefulWidget {
  final bool enable;
  final Icon title;
  final VoidCallback onTap;
  const _PageControlButton(
      {Key? key,
        required this.enable,
        required this.title,
        required this.onTap})
      : super(key: key);

  @override
  _PageControlButtonState createState() => _PageControlButtonState();
}

class _PageControlButtonState extends State<_PageControlButton> {
  Color normalTextColor = AppColors.iconPurpleColor;
  late Color textColor = widget.enable ? normalTextColor : AppColors.iconPurpleColor;

  @override
  void didUpdateWidget(_PageControlButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enable != widget.enable) {
      setState(() {
        textColor = widget.enable ? normalTextColor : AppColors.iconPurpleColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.enable ? widget.onTap : null,
        onHover: (b) {
          if (!widget.enable) return;
          setState(() {
            textColor = b ? normalTextColor.withAlpha(200) : normalTextColor;
          });
        },
        child: _ItemContainer(
            backgroundColor: Colors.transparent,
            child:widget.title));
  }
}

class _PageItem extends StatefulWidget {
  final int page;
  final bool isChecked;
  final ValueChanged<int> onTap;
  const _PageItem(
      {Key? key,
        required this.page,
        required this.isChecked,
        required this.onTap})
      : super(key: key);

  @override
  __PageItemState createState() => __PageItemState();
}

class __PageItemState extends State<_PageItem> {
  Color normalBackgroundColor = AppColors.paginationPurpleColor;
  Color normalHighlightColor = Colors.transparent;

  late Color backgroundColor = normalBackgroundColor;
  late Color highlightColor = normalHighlightColor;

  @override
  void didUpdateWidget(covariant _PageItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isChecked != widget.isChecked) {
      if (!widget.isChecked) {
        setState(() {
          backgroundColor = normalBackgroundColor;
          highlightColor = normalHighlightColor;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onHover: (b) {
          if (widget.isChecked) return;
          setState(() {
            backgroundColor = normalBackgroundColor;
            highlightColor = normalHighlightColor;
          });
        },
        onTap: () {
          widget.onTap(widget.page);
        },
        child: _ItemContainer(
          child: Text(
            widget.page.toString(),
            style: TextStyle(
                color: widget.isChecked ? AppColors.paginationPurpleColor:Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          backgroundColor: widget.isChecked ? highlightColor : backgroundColor,
        ));
  }
}

class _ItemContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  const _ItemContainer(
      {Key? key, required this.child, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      child: child,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.iconPurpleColor,width: 1),
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
    );
  }
}
