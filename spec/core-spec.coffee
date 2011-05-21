Core = require('../src/core').Core
Module = require('../src/module').Module

describe "core", ->	
	beforeEach ->
		@core = new Core
		
	
	describe "managing modules", ->
	
		describe "register modules", ->

			it "should register modules", ->
				testModule = new Module("Marvin")
				@core.register testModule
	
				expect(@core.modules["Marvin"]).toBe testModule
			
			it "should use the module's name as id", ->
				testModule = new Module("UseAsId")
				@core.register testModule
	
				expect(@core.modules["UseAsId"]).toBe testModule

		describe "handling the lifecycle of modules", ->
		
			it "should initialize a specified module", ->
				testModule = new Module("Marvin")
		
				@core.register testModule
				@core.start "Marvin"
		
				expect(testModule.isRunning).toBeTruthy()
				
			it "should stop a specified module", ->
				testModule = new Module("Marvin")

				@core.register testModule
				@core.stop "Marvin"

				expect(testModule.isRunning).toBeFalsy()
				
			it "should start all modules", -> 
				testModule = new Module "Marvin"
				anotherTestModule = new Module "Arthur"

				@core.register testModule
				@core.register anotherTestModule
				
				@core.startAll()

				expect(testModule.isRunning).toBeTruthy()
				expect(anotherTestModule.isRunning).toBeTruthy()
				
			it "should stop all modules", -> 
				testModule = new Module "Marvin"
				anotherTestModule = new Module "Arthur"
				
				@core.register testModule
				@core.register anotherTestModule

				@core.stopAll()

				expect(testModule.isRunning).toBeFalsy()
				expect(anotherTestModule.isRunning).toBeFalsy()
				
		#describe "provide a sandbox to modules", ->
			
			#it "should create a default sandbox instance for the module", ->
				
				