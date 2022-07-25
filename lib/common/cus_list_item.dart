import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/common/download_button.dart';
import 'package:practice_flutter_ui/common/fake_avatar.dart';
import 'package:practice_flutter_ui/provider.dart';

class CustomizedListItem extends HookConsumerWidget {
  const CustomizedListItem({
    Key? key,
    required this.pageContext,
    required this.index
  }) : super(key: key);

  final BuildContext pageContext;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(downloadStateProvider(index));
    final controller = ref.watch(downloadStateProvider(index).notifier);

    return ListTile(
      leading: const FakeAvatar(),
      title: Text("App $index", style: textTheme.headline6, overflow: TextOverflow.ellipsis,),
      subtitle: Text("Lorem ipsum dolor #$index", style: textTheme.caption,overflow: TextOverflow.ellipsis,),
      trailing: SizedBox(
        width: 100,
        child: DownloadButton(
          status: state.downloadStatus,
          progress: state.progress,
          onDownload: controller.download,
          onCancel: controller.cancel,
          onOpen: ()=> controller.openFile(pageContext),
        ),
      ),
    );
  }
}
