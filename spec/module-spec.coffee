{Module} = require('../src/module')
#{Sandbox} = require('../src/Sandbox')

describe "module", -> 
	beforeEach ->
		@name = "Forty-two"
		@options = {some: "option"}
		@module = new Module @name, @options


	it "should have a name", ->
		expect(@module.moduleName).toBe @name
	
	it "should have (optional) options", -> 
		expect(@module.options).toBe @options

	it "should be not be running before being intialized", ->
		expect(@module.isRunning).toBeFalsy()
		
	it "should be running after being initialized", ->
		@module.init()
		expect(@module.isRunning).toBeTruthy()
		
	it "should be stopped after being destroyed", ->
		@module.init()
		@module.destroy()
		
		expect(@module.isRunning).toBeFalsy()
		
	it "should get a sandbox when initializing", ->
		sandbox = ->
		@module.init(sandbox)
		
		expect(@module.sandbox).toBe(sandbox)