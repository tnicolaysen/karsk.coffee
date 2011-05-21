try {Sandbox} = require "../src/sandbox"
catch ignore

class Core
	# bindings = []

	constructor: -> 
		console.log "Created Core"
		@modules = []

	register: (module) -> 
		console.log "Registering '#{module.moduleName}' into the Core"
		@modules[module.moduleName] = module
		return
		
	_getModule: (moduleId) ->
		if @modules[moduleId]
			return @modules[moduleId]
		else
			console.warn "Did not find module with ID #{moduleId}" 
			return
		
	start: (moduleId) ->
		module = this._getModule(moduleId)

		if module?
			sandbox = new Sandbox(this)
			module.init(sandbox)
		
		return

	stop: (moduleId) ->
		module = this._getModule(moduleId)
		
		if module? 
			module.destroy()
		
		return
		
	startAll: ->
		this.start moduleId for moduleId of @modules
		return

	stopAll: ->
		this.stop moduleId for moduleId of @modules
		return

	# registerBinding: (eventName, functionToCall) ->
	# 	bindings[eventName] = functionToCall
	# 	
	# notify: (eventName, data) ->
	# 	bindings[eventName](data)
	# 	
	# ajax: (url, params, options) ->
	# 	defaultOptions = 
	# 	output "Maing a #{options.type}-request to'#{url}' with params #{params})"
	# 	serverData = "Hello World. I'm a response"
	# 	response = { status: "ok", data: serverData }
	# 	# base.call
	# 	options.success? response
	# 	return response
	# 	#failureCallback({status: "error" data: "Server F-ed up"})

try exports.Core = Core
catch ignore