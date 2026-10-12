import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/domain/usecases/auth/change_contact_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth/otp_verification/otp_verification_state.dart';
import 'package:spa_booking/src/presentation/view/auth/otp_verification/view/otp_verification_view.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../../../bloc/profile/profile_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  void _showDeleteAccountDialog(BuildContext context) {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFDC2626),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.confirmDeleteAccount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C2420),
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            l10n.deleteAccountMessage,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7A6F68),
              height: 1.4,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  color: Color(0xFF7A6F68),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AppButton(
              text: l10n.deletePermanently,
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(
                  const ProfileDeleteAccountRequested(),
                );
              },
              variant: AppButtonVariant.destructive,
              borderRadius: BorderRadius.circular(12),
              size: AppButtonSize.sm,
            ),
          ],
        );
      },
    );
  }

  void _showChangeEmailSheet(BuildContext context, String currentEmail) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final controller = TextEditingController(text: currentEmail);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isVi ? 'Thay đổi Gmail / Email' : 'Change Email',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E2022),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.x, size: 20),
                        onPressed: () => Navigator.of(sheetContext).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isVi
                        ? 'Hệ thống sẽ gửi mã xác thực OTP về Email mới để xác nhận.'
                        : 'A verification OTP will be sent to the new email address.',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 18),
                  AppTextField(
                    controller: controller,
                    label: 'Email mới',
                    hint: 'newemail@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    text: isLoading
                        ? (isVi ? 'Đang gửi mã...' : 'Sending...')
                        : (isVi
                              ? 'Gửi mã OTP xác thực'
                              : 'Send Verification OTP'),
                    onPressed: isLoading
                        ? null
                        : () async {
                            final newEmail = controller.text.trim();
                            if (newEmail.isEmpty || !newEmail.contains('@')) {
                              AppToast.error(
                                context,
                                message: isVi
                                    ? 'Vui lòng nhập email hợp lệ'
                                    : 'Please enter a valid email',
                              );
                              return;
                            }

                            setState(() => isLoading = true);
                            final changeContact = sl<ChangeContactUseCase>();
                            final res = await changeContact.requestChangeEmail(
                              newEmail,
                            );
                            setState(() => isLoading = false);

                            res.fold(
                              (failure) {
                                AppToast.error(
                                  context,
                                  message: failure.message,
                                );
                              },
                              (otpResult) async {
                                Navigator.of(sheetContext).pop();
                                final verified = await Navigator.of(context)
                                    .push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => OtpVerificationPage(
                                          identifier: newEmail,
                                          flowType: OtpFlowType.changeEmail,
                                          mockOtp: otpResult.otp,
                                          expiresInSeconds:
                                              otpResult.expiresInSeconds,
                                        ),
                                      ),
                                    );

                                if (verified == true && context.mounted) {
                                  context.read<ProfileBloc>().add(
                                    const ProfileRefreshed(),
                                  );
                                  AppToast.success(
                                    context,
                                    message: isVi
                                        ? 'Cập nhật Email thành công!'
                                        : 'Email updated successfully!',
                                  );
                                }
                              },
                            );
                          },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showChangePhoneSheet(BuildContext context, String currentPhone) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final controller = TextEditingController(text: currentPhone);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        bool isLoading = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isVi ? 'Thay đổi Số điện thoại' : 'Change Phone Number',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E2022),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.x, size: 20),
                        onPressed: () => Navigator.of(sheetContext).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isVi
                        ? 'Hệ thống sẽ gửi mã xác thực OTP về Số điện thoại mới để xác nhận.'
                        : 'A verification OTP will be sent to the new phone number.',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 18),
                  AppTextField(
                    controller: controller,
                    label: 'Số điện thoại mới',
                    hint: '0912345678',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    text: isLoading
                        ? (isVi ? 'Đang gửi mã...' : 'Sending...')
                        : (isVi
                              ? 'Gửi mã OTP xác thực'
                              : 'Send Verification OTP'),
                    onPressed: isLoading
                        ? null
                        : () async {
                            final newPhone = controller.text.trim();
                            if (newPhone.isEmpty) {
                              AppToast.error(
                                context,
                                message: isVi
                                    ? 'Vui lòng nhập số điện thoại hợp lệ'
                                    : 'Please enter a valid phone number',
                              );
                              return;
                            }

                            setState(() => isLoading = true);
                            final changeContact = sl<ChangeContactUseCase>();
                            final res = await changeContact.requestChangePhone(
                              newPhone,
                            );
                            setState(() => isLoading = false);

                            res.fold(
                              (failure) {
                                AppToast.error(
                                  context,
                                  message: failure.message,
                                );
                              },
                              (otpResult) async {
                                Navigator.of(sheetContext).pop();
                                final verified = await Navigator.of(context)
                                    .push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => OtpVerificationPage(
                                          identifier: newPhone,
                                          flowType: OtpFlowType.changePhone,
                                          mockOtp: otpResult.otp,
                                          expiresInSeconds:
                                              otpResult.expiresInSeconds,
                                        ),
                                      ),
                                    );

                                if (verified == true && context.mounted) {
                                  context.read<ProfileBloc>().add(
                                    const ProfileRefreshed(),
                                  );
                                  AppToast.success(
                                    context,
                                    message: isVi
                                        ? 'Cập nhật Số điện thoại thành công!'
                                        : 'Phone number updated successfully!',
                                  );
                                }
                              },
                            );
                          },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showRemoveContactDialog({
    required BuildContext context,
    required bool isEmail,
  }) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final targetName = isEmail
        ? 'Email'
        : (isVi ? 'Số điện thoại' : 'Phone number');

    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(
          isVi ? 'Gỡ $targetName?' : 'Remove $targetName?',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(
          isVi
              ? 'Tài khoản cần giữ lại ít nhất 1 phương thức nhận OTP để đăng nhập an toàn.'
              : 'Your account must keep at least 1 contact method for OTP authentication.',
          style: const TextStyle(fontSize: 13.5, color: Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: Text(isVi ? 'Hủy' : 'Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogCtx).pop();
              final changeContact = sl<ChangeContactUseCase>();
              final res = isEmail
                  ? await changeContact.removeEmail()
                  : await changeContact.removePhone();

              res.fold(
                (failure) => AppToast.error(context, message: failure.message),
                (_) {
                  context.read<ProfileBloc>().add(const ProfileRefreshed());
                  AppToast.success(
                    context,
                    message: isVi
                        ? 'Đã gỡ $targetName thành công'
                        : '$targetName removed successfully',
                  );
                },
              );
            },
            child: Text(
              isVi ? 'Gỡ bỏ' : 'Remove',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        title: isVi ? 'Cài đặt' : 'Settings',
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            AppToast.error(context, message: state.errorMessage!);
          }
        },
        builder: (context, state) {
          final user = state.user;
          final email = user?.email ?? '';
          final phone = user?.phone ?? '';

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              // Contact Methods Section
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  isVi ? 'THÔNG TIN LIÊN HỆ & OTP' : 'CONTACT INFO & OTP',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF64748B),
                    letterSpacing: 0.6,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Email Tile
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          LucideIcons.mail,
                          size: 18,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      title: const Text(
                        'Email / Gmail',
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      subtitle: Text(
                        email.isNotEmpty
                            ? email
                            : (isVi ? 'Chưa liên kết' : 'Not linked'),
                        style: TextStyle(
                          fontSize: 13,
                          color: email.isNotEmpty
                              ? const Color(0xFF64748B)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (email.isNotEmpty && phone.isNotEmpty)
                            IconButton(
                              icon: const Icon(
                                LucideIcons.trash,
                                size: 16,
                                color: Color(0xFF94A3B8),
                              ),
                              tooltip: isVi ? 'Gỡ Email' : 'Remove Email',
                              onPressed: () => _showRemoveContactDialog(
                                context: context,
                                isEmail: true,
                              ),
                            ),
                          TextButton(
                            onPressed: () =>
                                _showChangeEmailSheet(context, email),
                            child: Text(
                              email.isNotEmpty
                                  ? (isVi ? 'Đổi' : 'Change')
                                  : (isVi ? 'Liên kết' : 'Link'),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFC6E58),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1, indent: 60, endIndent: 20),

                    // Phone Tile
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          LucideIcons.phone,
                          size: 18,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                      title: Text(
                        isVi ? 'Số điện thoại' : 'Phone Number',
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      subtitle: Text(
                        phone.isNotEmpty
                            ? phone
                            : (isVi ? 'Chưa liên kết' : 'Not linked'),
                        style: TextStyle(
                          fontSize: 13,
                          color: phone.isNotEmpty
                              ? const Color(0xFF64748B)
                              : const Color(0xFF94A3B8),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (phone.isNotEmpty && email.isNotEmpty)
                            IconButton(
                              icon: const Icon(
                                LucideIcons.trash,
                                size: 16,
                                color: Color(0xFF94A3B8),
                              ),
                              tooltip: isVi ? 'Gỡ SĐT' : 'Remove Phone',
                              onPressed: () => _showRemoveContactDialog(
                                context: context,
                                isEmail: false,
                              ),
                            ),
                          TextButton(
                            onPressed: () =>
                                _showChangePhoneSheet(context, phone),
                            child: Text(
                              phone.isNotEmpty
                                  ? (isVi ? 'Đổi' : 'Change')
                                  : (isVi ? 'Liên kết' : 'Link'),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFC6E58),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Security & Danger Zone Section
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  isVi ? 'BẢO MẬT & TÀI KHOẢN' : 'SECURITY & ACCOUNT',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF64748B),
                    letterSpacing: 0.6,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: state.isDeletingAccount
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFFDC2626),
                                ),
                              )
                            : const Icon(
                                LucideIcons.trash,
                                size: 18,
                                color: Color(0xFFDC2626),
                              ),
                      ),
                      title: Text(
                        l10n.deleteAccount,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                      subtitle: Text(
                        isVi
                            ? 'Xoá vĩnh viễn tài khoản và dữ liệu cá nhân'
                            : 'Permanently remove your account and data',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                      trailing: const Icon(
                        LucideIcons.chevron_right,
                        size: 18,
                        color: Color(0xFFCBD5E1),
                      ),
                      onTap: state.isDeletingAccount
                          ? null
                          : () => _showDeleteAccountDialog(context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
