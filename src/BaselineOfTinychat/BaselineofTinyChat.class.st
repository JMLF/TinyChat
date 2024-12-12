Class {
	#name : 'BaselineOfTinychat',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTinychat',
	#package : 'BaselineOfTinychat'
}

{ #category : 'baselines' }
BaselineOfTinychat >> baseline: spec [ 
	<baseline>

	spec
		package: 'Tinychat';
		package: 'TinyChat-client';
		package: 'TinyChat-server'
]
