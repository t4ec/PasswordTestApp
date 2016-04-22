# PasswordTestApp
Test iOS application written in swift

# Task
1. The application will be for storing a single password. And consist of two screens.
1. The first screen will have a message saying “Authentication is needed to access your password. Tap to login”.
1. After tapping the screen, the iOS fingerprint scan dialog will popup. If the fingerprint scan is successful, the app will continue to the second screen.
1. The second screen will have a single field. And a save button.
1. If there was a password stored in the field, it will be displayed in the field.
1. The field will be editable. If the user types in a new password, and presses save, the new password will be saved.

To keep the app simple, just single text field is necessary. No need to store multiple passwords.

For simplicity NSUserDefaults was used for storing password instead of keychain.
