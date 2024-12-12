Class {
	#name : 'TCServer',
	#superclass : 'Object',
	#instVars : [
		'messagesQueue',
		'teapotServer'
	],
	#category : 'TinyChat-Server',
	#package : 'TinyChat-Server'
}

{ #category : 'public' }
TCServer class >> startOn: aPortNumber [

	^ self new
		  initializePort: aPortNumber;
		  registerRoutes;
		  registerErrorHandlers;
		  yourself
]

{ #category : 'registration' }
TCServer class >> stopAll [ 
	self allInstancesDo: #stop
]

{ #category : 'adding' }
TCServer >> addMessage: aRequest [

	messagesQueue add:
		(TCMessage from: (aRequest at: #sender) text: (aRequest at: #text))
]

{ #category : 'as yet unclassified' }
TCServer >> initialize [ 
super initialize.
messagesQueue := TCMessageQueue new.
]

{ #category : 'as yet unclassified' }
TCServer >> initializePort: anInteger [

	teapotServer := Teapot configure: {
			                (#defaultOutput -> #text).
			                (#port -> anInteger).
			                (#debugMode -> true) }.
	teapotServer start
]

{ #category : 'adding' }
TCServer >> messageCount [ 
^ messagesQueue size
]

{ #category : 'adding' }
TCServer >> messagesFrom: request [
	^ messagesQueue formattedMessagesFrom: (request at: #id)
]

{ #category : 'as yet unclassified' }
TCServer >> registerErrorHandlers [

	teapotServer exception:
		KeyNotFound -> (TeaResponse notFound body: 'No such
message')
]

{ #category : 'as yet unclassified' }
TCServer >> registerRoutes [

	teapotServer
		GET: '/messages/count' -> (Send message: #messageCount to: self);
		GET:
			'/messages/<id:IsInteger>'
			-> (Send message: #messagesFrom: to: self);
		POST: '/messages/add' -> (Send message: #addMessage: to: self)
]

{ #category : 'accessing' }
TCServer >> stop [ 
	teapotServer stop.
	messagesQueue ifNotNil: #reset.
]
