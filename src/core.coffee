class Core
	# bindings = []

	constructor: -> 
		console.log "Created Core"
		@modules = []

	register: (module) -> 
		console.log "Registering '#{module.moduleName}' into the Core"
		@modules[module.moduleName] = module
		return

	start: (moduleId) ->
		#modules[moduleId].sandbox = new Sandbox(this);
		module = @modules[moduleId]

		if module?
			module.init()
		else
			console.warn "Could not initialize module '#{moduleId}'" 
		
		return

	stop: (moduleId) ->
		module = @modules[moduleId]
		
		if module? 
			module.destroy()
		else 
			console.warn "Could not initialize module '#{moduleId}'"
		
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

exports.Core = Core