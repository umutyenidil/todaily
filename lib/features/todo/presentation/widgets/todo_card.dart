
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todaily/core/extensions/widget_ext.dart';
import 'package:todaily/core/resources/color_res.dart';

import 'package:todaily/features/todo/domain/entities/todo_entity.dart';

import '../blocs/todo/todo_bloc.dart';

class TodoCard extends StatefulWidget {
  final TodoEntity todo;

  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  Size? _renderSize;

  late final AnimationController _controller;
  Animation<double>? _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _renderSize = getRenderSize(_key.currentContext!);
        _animation = Tween<double>(
          begin: _renderSize!.height - 20,
          end: 0,
        ).animate(_controller);
      });
    });

    super.initState();

    _controller = AnimationController(
      duration: Durations.short4,
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_controller);
  }

  Size getRenderSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < 0) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: ColorRes.RED400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            key: _key,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 75,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.todo.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        widget.todo.description,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (_animation != null)
                  ? AnimatedBuilder(
                      animation: _animation!,
                      builder: (context, _) {
                        return Positioned(
                          top: _animation?.value,
                          child: SizedBox(
                            height: _renderSize?.height,
                            width: _renderSize?.width,
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                color: ColorRes.BLACK.withOpacity(_controller.value * 0.75),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _colorAnimation,
                                      builder: (_, __) {
                                        return FractionallySizedBox(
                                          widthFactor: 0.5,
                                          child: SizedBox(
                                            height: 4,
                                            child: DecoratedBox(
                                              decoration: ShapeDecoration(
                                                color: _colorAnimation.value,
                                                shape: const StadiumBorder(),
                                              ),
                                            ),
                                          ),
                                        ).padding(bottom: 8);
                                      },
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          BlocBuilder<TodoBloc, TodoState>(
                                            builder: (context, state) {
                                              print(state);
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context.read<TodoBloc>().add(
                                                        DeleteTodoEvent(
                                                          id: widget.todo.id,
                                                        ),
                                                      );
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    state is! TodoLoading
                                                        ? const Icon(
                                                            Iconsax.trash,
                                                          )
                                                        : const SizedBox.square(
                                                            dimension: 20,
                                                            child: CircularProgressIndicator(
                                                              strokeCap: StrokeCap.round,
                                                              strokeWidth: 3,
                                                            ),
                                                          ),
                                                    const Text(
                                                      "Delete",
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
