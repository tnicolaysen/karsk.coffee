class Core
	this.modules
	# bindings = []

	constructor: -> 
		console.log "Created Core"
		this.modules = []

	register: (module) -> 
		console.log this.modules
		console.log "Registering '#{module.moduleName}' into the Core"
		this.modules[module.moduleName] = module

	start: (moduleId) ->
		#modules[moduleId].sandbox = new Sandbox(this);
		module = this.modules[moduleId]

		if module?
			module.init()
		else
			console.warn "Could not initialize module '#{moduleId}'" 
	
	stop: (moduleId) ->
		module = this.modules[moduleId]
		
		if module? 
			module.destroy()
		else 
			console.warn "Could not initialize module '#{moduleId}'"
		
	startAll: ->
		this.start moduleId for moduleId of this.modules
		return

	stopAll: ->
		this.stop moduleId for moduleId of this.modules
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

exports.Core = Core