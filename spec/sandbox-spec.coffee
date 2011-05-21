{Sandbox} = require('../src/sandbox')
{Core} = require('../src/core')

describe "sandbox", -> 
	
	it "should take a Core when creating it", ->
		core = new Core
		sandbox = new Sandbox(core)
		
		expect(sandbox.core).toBe(core)