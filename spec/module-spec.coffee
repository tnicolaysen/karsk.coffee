{Module, ModuleStatus} = require('../src/module')

describe "module", -> 
		
	it "should have a name", ->
		m = new Module "Banana", {}
		expect(m.moduleName).toBe "Banana"
	
	it "should take some options", -> 
		options = {some: "options"}
		m = new Module "Banana", options
		expect(m.options).toBe options

	it "should be not be running before being intialized", ->
		m = new Module "Banana", {}
		expect(m.isRunning).toBeFalsy()
		
	it "should be running after being initialized", ->
		m = new Module "Banana", {}
		m.init()
		expect(m.isRunning).toBeTruthy()
		
	it "should be stopped after being destroyed", ->
		m = new Module "Banana", {}
		m.init()
		m.destroy()
		expect(m.isRunning).toBeFalsy()