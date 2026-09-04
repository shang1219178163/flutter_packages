/// 资源整合（精简版：仅提供网络图地址）。
class AppRes {
  static final RImage image = RImage._instance;
}

class RImage {
  static final RImage _instance = RImage();

  /// 网图数组
  final List<String> urls = [
    'https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737078692/im/msg/rec/651722246582308864.jpg',
    'https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737078705/im/msg/rec/651722301611577344.jpg',
    'https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806216854147072.jpg',
    'https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806216086589440.jpg',
    'https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337131/im/msg/rec/652806218489925632.jpg',
  ];
}
