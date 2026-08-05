# en_expansion_panel

<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

基于flutter 2.5.0 的原生组件功能升级版;
Based on flutter 2.5.0 native component feature upgrade;

## Features

TODO: 
1. 支持默认箭头隐藏;
2. 支持自定义箭头;
3. 支持箭头 leading 和 tailing 位置布局；
***
TODO in English

1.support for default arrow hiding;

2.support for custom arrow;

3.support for arrow leading and tailing location layout

## Getting started

Example of pubsec.yaml
```
dependencies:
  flutter:
    sdk: flutter

  en_expansion_panel: ^2.0.0
```
## Usage
TODO: 
```
EnExpansionPanelList(
    //...
    return EnExpansionPanel(
      //code ...
      
      /// custom property
      /// color
      arrowColor: Colors.blue,
      /// leading, tailing, none
      arrowPosition: EnExpansionPanelArrowPosition.tailing,
      /// padding
      arrowPadding: const EdgeInsets.all(5),
      /// custome wiget
      arrow: const Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
      /// custome wiget by isExpanded
      arrowExpanded: const Icon(Icons.keyboard_arrow_down, color: Colors.red,),
      /// custom property
      
      headerBuilder: (BuildContext context, bool isExpanded) {
```
## example
```
  ///build EnExpansionPanelList
  Widget buildExpansionPanelList() {
    return SingleChildScrollView(
      child: Container(
        child: EnExpansionPanelList(
          dividerColor: Colors.red,
          // elevation: 4,
          expandedHeaderPadding: EdgeInsets.only(top: 0, bottom: 0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<EnExpansionPanel>((item) {
            return EnExpansionPanel(
              isExpanded: item.isExpanded,
              canTapOnHeader: true,
              /// custom property
              /// color
              arrowColor: Colors.blue,
              /// leading, tailing, none
              arrowPosition: EnExpansionPanelArrowPosition.tailing,
              /// padding
              arrowPadding: const EdgeInsets.all(5),
              /// custome wiget
              arrow: const Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
              /// custome wiget by isExpanded
              arrowExpanded: const Icon(Icons.keyboard_arrow_down, color: Colors.red,),
              /// custom property
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  // color: Colors.green,
                  child: ListTile(
                    title: Text(item.headerValue),
                    subtitle: Text("subtitle"),
                    // trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.red,),
                    // trailing: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, color: Colors.red,),
                  ),
                );
              },
              body: _buildExpansionPanelBody(item.index),
            );
          }).toList(),
        ),
      ),
    );
  }
```
//## Additional information

## Screenshot

<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/en_expansion_panel/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20-%202021-10-28%20at%2015.06.49.png" width="220">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/en_expansion_panel/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20-%202021-10-28%20at%2015.07.08.png" width="220">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/en_expansion_panel/screenshots/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20-%202021-10-28%20at%2015.18.14.png" width="220">
</p>