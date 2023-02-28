part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
    this.padding,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Container(
              decoration: suggestionListDecoration ??
                  BoxDecoration(color: Colors.white),
              constraints: BoxConstraints(
                maxHeight: suggestionListHeight,
                minHeight: 0,
              ),
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onTap(data[index]);
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
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
