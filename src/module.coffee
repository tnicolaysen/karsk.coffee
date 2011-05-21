class Module
	constructor: (@moduleName, @options) ->
		console.info "Creating module '#{@moduleName}'"
		
	init: (@sandbox) ->
		console.info "Initializing '#{@moduleName}'"
		console.warn "No sandbox provided" unless @sandbox? 
			
		this.isRunning = true
		
	destroy: ->
		console.info "Destroying '#{@moduleName}"
		this.isRunning = false

try exports.Module = Module
catch ignore
	