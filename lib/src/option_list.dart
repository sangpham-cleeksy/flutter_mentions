part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.headerBuilder,
    this.suggestionListDecoration,
    this.margin,
    this.header,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final Widget Function(String)? headerBuilder;
  final String? header;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>)? onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty || header != null
        ? Container(
            margin: margin,
            decoration:
                suggestionListDecoration ?? BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
              minHeight: 0,
            ),
            child: data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onTap!(data[index]);
                        },
                        child: suggestionBuilder != null
                            ? suggestionBuilder!(data[index])
                            : Container(
                                color: Colors.blue,
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  data[index]['display'],
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                      );
                    },
                  )
                : header != null
                    ? headerBuilder != null
                        ? headerBuilder!(header!)
                        : Container(
                            color: Colors.blue,
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              header!,
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                    : Container())
        : Container();
  }
}
