Class {
	#name : 'BaselineOfTinyChat',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTinychat',
	#package : 'BaselineOfTinychat'
}

{ #category : 'baselines' }
BaselineOfTinyChat >> baseline: spec [ 
	<baseline>

	spec
		package: 'Tinychat';
		package: 'TinyChat-client';
		package: 'TinyChat-server'
]
