import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../../app/di/dependency_injection.dart';
import '../../../../../app/router/app_router.gr.dart';
import '../../../../../domain/entities/auth/user.dart';
import '../../../../../shared/widgets/toast/app_toast.dart';
import '../../../../bloc/profile_edit/profile_edit_bloc.dart';
import '../body_view/profile_edit_body_view.dart';
import '../widgets/profile_edit_circular_button.dart';
import '../widgets/profile_edit_gender_bottom_sheet.dart';

@RoutePage()
class ProfileEditPage extends StatelessWidget {
  final User? user;
  final bool isInitialSetup;

  const ProfileEditPage({super.key, this.user, this.isInitialSetup = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileEditBloc>()
        ..add(
          ProfileEditStarted(initialUser: user, isInitialSetup: isInitialSetup),
        ),
      child: ProfileEditView(isInitialSetup: isInitialSetup, initialUser: user),
    );
  }
}

class ProfileEditView extends StatefulWidget {
  final bool isInitialSetup;
  final User? initialUser;

  const ProfileEditView({
    super.key,
    this.isInitialSetup = false,
    this.initialUser,
  });

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _dobController;
  late final TextEditingController _genderController;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileEditBloc>().state;
    _fullNameController = TextEditingController(text: state.fullName);
    _dobController = TextEditingController(text: state.displayDateOfBirth);
    _genderController = TextEditingController(text: state.gender);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth(
    BuildContext context,
    String currentDate,
  ) async {
    DateTime initial = DateTime(2002, 2, 10);
    try {
      if (currentDate.isNotEmpty) {
        initial = DateTime.parse(currentDate);
      }
    } catch (_) {}

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: _coralColor,
              onPrimary: Colors.white,
              onSurface: _textDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && context.mounted) {
      final yyyy = picked.year.toString().padLeft(4, '0');
      final mm = picked.month.toString().padLeft(2, '0');
      final dd = picked.day.toString().padLeft(2, '0');
      final formatted = '$yyyy-$mm-$dd';
      context.read<ProfileEditBloc>().add(
        ProfileEditDateOfBirthChanged(formatted),
      );
    }
  }

  void _showGenderSelector(BuildContext context, String currentGender) {
    ProfileEditGenderBottomSheet.show(
      context,
      currentGender: currentGender,
      onSelected: (gender) {
        context.read<ProfileEditBloc>().add(ProfileEditGenderChanged(gender));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditBloc, ProfileEditState>(
      listenWhen: (prev, current) =>
          prev.status != current.status ||
          prev.errorMessage != current.errorMessage ||
          prev.fullName != current.fullName ||
          prev.phoneNumber != current.phoneNumber ||
          prev.dateOfBirth != current.dateOfBirth ||
          prev.gender != current.gender,
      listener: (context, state) {
        if (state.fullName != _fullNameController.text &&
            _fullNameController.text.isEmpty) {
          _fullNameController.text = state.fullName;
        }
        if (_dobController.text != state.displayDateOfBirth) {
          _dobController.text = state.displayDateOfBirth;
        }
        if (_genderController.text != state.gender) {
          _genderController.text = state.gender;
        }

        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          AppToast.error(context, message: state.errorMessage!);
        }

        if (state.isSuccess) {
          AppToast.success(context, message: 'Profile saved successfully!');
          if (widget.isInitialSetup) {
            context.router.replaceAll([const RootRoute()]);
          } else {
            context.router.maybePop(true);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      ProfileEditCircularButton(
                        icon: LucideIcons.arrow_left,
                        onTap: () {
                          if (context.router.canPop()) {
                            context.router.maybePop();
                          } else {
                            context.router.replaceAll([const RootRoute()]);
                          }
                        },
                      ),

                      // Title
                      const Text(
                        'Profile Editing',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),

                      // Three Dots Button
                      ProfileEditCircularButton(
                        icon: LucideIcons.ellipsis,
                        onTap: () {
                          AppToast.info(context, message: 'Profile Options');
                        },
                      ),
                    ],
                  ),
                ),

                // Form Scrollable Body
                Expanded(
                  child: ProfileEditBodyView(
                    avatarSeed: state.fullName.isNotEmpty
                        ? state.fullName
                        : (widget.initialUser?.fullName ?? 'Eva Huff'),
                    fullNameController: _fullNameController,
                    dobController: _dobController,
                    genderController: _genderController,
                    onPickDob: () =>
                        _pickDateOfBirth(context, state.dateOfBirth),
                    onSelectGender: () =>
                        _showGenderSelector(context, state.gender),
                    onFullNameChanged: (val) {
                      context.read<ProfileEditBloc>().add(
                        ProfileEditFullNameChanged(val),
                      );
                    },
                    isSubmitting: state.isSubmitting,
                    onSubmit: () {
                      context.read<ProfileEditBloc>().add(
                        const ProfileEditSubmitted(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
