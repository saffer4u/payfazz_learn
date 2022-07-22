import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'basic_class.g.dart';

@CopyWith()
class BasicClass extends Equatable {
  final String id;
  final String? text;

  const BasicClass({required this.id, this.text});
  
  @override
  List<Object?> get props => [id,text];
}
