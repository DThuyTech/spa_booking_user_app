class TermsSectionItem {
  final String title;
  final String content;

  const TermsSectionItem({required this.title, required this.content});
}

class TermsOfUseMockData {
  const TermsOfUseMockData._();

  static const String lastUpdated = 'LAST UPDATED: OCTOBER 24, 2023';

  static const List<TermsSectionItem> sections = [
    TermsSectionItem(
      title: '1. Acceptance of Terms',
      content:
          'By downloading, accessing, or using the Aura salon booking application ("App"), you agree to be bound by these Terms of Use ("Terms"). If you do not agree to these terms, do not use the App. We may update these Terms from time to time, and your continued use constitutes acceptance of those changes.',
    ),
    TermsSectionItem(
      title: '2. User Obligations',
      content:
          'As a user of the App, you agree to:\n\n• Provide accurate and complete information when creating an account or making a booking.\n• Maintain the security and confidentiality of your account credentials.\n• Be responsible for all activities that occur under your account.\n• Respect the cancellation and no-show policies of the individual salons booked through the App.\n• Not use the App for any illegal or unauthorized purpose.',
    ),
    TermsSectionItem(
      title: '3. Booking and Cancellations',
      content:
          'The App facilitates bookings between you and independent salons. Aura is not responsible for the quality of services provided by the salons. Each salon has its own cancellation policy, which will be presented to you prior to confirming a booking. Failure to adhere to these policies may result in cancellation fees charged to your saved payment method.',
    ),
    TermsSectionItem(
      title: '4. Privacy Policy Reference',
      content:
          'Your privacy is important to us. Our collection and use of personal information in connection with the App is described in our Privacy Policy. By using the App, you consent to the data practices described in that policy.',
    ),
    TermsSectionItem(
      title: '5. Limitation of Liability',
      content:
          'To the maximum extent permitted by applicable law, Aura and its affiliates shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from (a) your access to or use of or inability to access or use the App; (b) any conduct or content of any third party on the App, including without limitation, any defamatory, offensive, or illegal conduct of other users or third parties.',
    ),
    TermsSectionItem(
      title: '6. Termination',
      content:
          'We may terminate or suspend your access to the App immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the App will immediately cease.',
    ),
  ];
}
