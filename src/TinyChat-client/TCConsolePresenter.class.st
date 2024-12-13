Class {
	#name : 'TCConsolePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'input',
		'list',
		'chat'
	],
	#classInstVars : [
		'list',
		'input',
		'chat'
	],
	#category : 'TinyChat-client',
	#package : 'TinyChat-client'
}

{ #category : 'as yet unclassified' }
TCConsolePresenter class >> attach: aTinyChat [
| window |
          window := self new chat: aTinyChat.
          window open whenClosedDo: [ aTinyChat disconnect ].

          ^ window
]

{ #category : 'accessing' }
TCConsolePresenter >> chat: anObject [
chat:= anObject 
]

{ #category : 'layout' }
TCConsolePresenter >> defaultLayout [ 
^ SpBoxLayout newTopToBottom
      add: list;
      add: input ;
      yourself
]

{ #category : 'initialization - deprecated' }
TCConsolePresenter >> initializeWidgets [

list := self newList.
  input := self newTextInput.
  input
    placeholder: 'Type your message here...';
    whenSubmitDo: [ :string |
      chat send: string.
      input text: '' ].
  self focusOrder add: input.
]

{ #category : 'accessing' }
TCConsolePresenter >> input [
^ input
]

{ #category : 'accessing' }
TCConsolePresenter >> list [
^list
]

{ #category : 'initialization - deprecated' }
TCConsolePresenter >> print: aCollectionOfMessages [
  list items: (aCollectionOfMessages collect: [  :m |  m printString ])
]

{ #category : 'accessing' }
TCConsolePresenter >> title [ 
^ 'TinyChat'
]
