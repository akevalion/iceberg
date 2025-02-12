"
I implement the dialog to edit plaintext credentials.
"
Class {
	#name : #IceTipEditPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #layout }
IceTipEditPlaintextCredentialsModel class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: #usernameLabel
				   width: 80 * self currentWorld displayScaleFactor;
				   add: #usernameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newLeftToRight
				   add: #passwordLabel
				   width: 80 * self currentWorld displayScaleFactor;
				   add: #passwordInput;
				   yourself)
		  height: self inputTextHeight;
		  yourself
]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> accept [ 
	
	^ self acceptEditAction
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 4 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		username: self username;
		password: self password
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	passwordInput text: credentials password
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> titleForWindow [

	^ 'Edit credential for ' , credentials host
]
