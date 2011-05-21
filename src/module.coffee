class Module
	constructor: (@moduleName, @options) ->
		console.log "Creating module '#{@moduleName}'"
		
	init: ->
		console.log "Initializing '#{@moduleName}'"
		this.isRunning = true
		
	destroy: ->
		console.log "Destroying '#{@moduleName}"
		this.isRunning = false

exports.Module = Module