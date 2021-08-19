title=FIDO Authentication
tags=library, architecture, distribution, authentication
summary=The answer to the world's password problem.
~~~~~~

[Website](https://fidoalliance.org/) | [Specs](https://fidoalliance.org/specifications/download/)

### [How it Works](https://fidoalliance.org/how-fido-works/)
The FIDO protocols use standard public key cryptography techniques to provide stronger authentication. During registration with an online service, the user’s client device creates a new key pair. It retains the private key and registers the public key with the online service. Authentication is done by the client device proving possession of the private key to the service by signing a challenge. The client’s private keys can be used only after they are unlocked locally on the device by the user. The local unlock is accomplished by a user–friendly and secure action such as swiping a finger, entering a PIN, speaking into a microphone, inserting a second–factor device or pressing a button.

The FIDO protocols are designed from the ground up to protect user privacy. The protocols do not provide information that can be used by different online services to collaborate and track a user across the services. Biometric information, if used, never leaves the user’s device.

Registration:

* User is prompted to choose an available FIDO authenticator that matches the online service’s acceptance policy.
* User unlocks the FIDO authenticator using a fingerprint reader, a button on a second–factor device, securely–entered PIN or other method.
* User’s device creates a new public/private key pair unique for the local device, online service and user’s account.
* Public key is sent to the online service and associated with the user’s account. The private key and any information about the local authentication method (such as biometric measurements or templates) never leave the local device.

Login:

* Online service challenges the user to login with a previously registered device that matches the service’s acceptance policy.
* User unlocks the FIDO authenticator using the same method as at Registration time.
* Device uses the user’s account identifier provided by the service to select the correct key and sign the service’s challenge.
* Client device sends the signed challenge back to the service, which verifies it with the stored public key and logs in the user.

