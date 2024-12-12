Class {
	#name : 'TCMessageQueue',
	#superclass : 'Object',
	#instVars : [
		'messages'
	],
	#category : 'TinyChat-Server',
	#package : 'TinyChat-Server'
}

{ #category : 'initialization' }
TCMessageQueue >> add: aMessage [ 
 
messages add: aMessage 
]

{ #category : 'as yet unclassified' }
TCMessageQueue >> formattedMessagesFrom: aMessageNumber [

	^ String streamContents: [ :formattedMessagesStream |
		  (self listFrom: aMessageNumber) do: [ :m |
			  formattedMessagesStream << m printString ] ]
]

{ #category : 'initialization' }
TCMessageQueue >> initialize [ 
super initialize.
messages := OrderedCollection new.
]

{ #category : 'accessing' }
TCMessageQueue >> listFrom: aIndex [

	^ (aIndex > 0 and: [ aIndex <= messages size ])
		  ifTrue: [ messages copyFrom: aIndex to: messages size ]
		  ifFalse: [ #(  ) ]
]

{ #category : 'initialization' }
TCMessageQueue >> reset [ 
 
messages removeAll 
]

{ #category : 'accessing' }
TCMessageQueue >> size [ 
^ messages size
]
