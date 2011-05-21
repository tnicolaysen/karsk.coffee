Core = require('../src/core').Core
Module = require('../src/module').Module

describe "core", ->	
	beforeEach ->
		@core = new Core
		
		@testModuleId = "Marvin"
		@testModule = new Module @testModuleId
		
	
	describe "managing modules", ->
	
		describe "register modules", ->

			it "should register modules", ->
				@core.register @testModule
	
				expect(@core.modules["Marvin"]).toBe @testModule
			
			it "should use the module's name as id", ->
				@core.register @testModule
	
				expect(@core.modules[@testModuleId]).toBe @testModule

		describe "handling the lifecycle of modules", ->
		
			it "should initialize a specified module", ->
				@core.register @testModule
				@core.start @testModuleId
		
				expect(@testModule.isRunning).toBeTruthy()
				
			it "should stop a specified module", ->
				@core.register @testModule
				@core.stop @testModuleid

				expect(@testModule.isRunning).toBeFalsy()
				
			it "should start all modules", -> 
				anotherTestModule = new Module "Arthur"

				@core.register @testModule
				@core.register anotherTestModule
				
				@core.startAll()

				expect(@testModule.isRunning).toBeTruthy()
				expect(anotherTestModule.isRunning).toBeTruthy()
				
			it "should stop all modules", -> 
				anotherTestModule = new Module "Arthur"
				
				@core.register @testModule
				@core.register anotherTestModule

				@core.stopAll()

				expect(@testModule.isRunning).toBeFalsy()
				expect(anotherTestModule.isRunning).toBeFalsy()
				
		xdescribe "provide a sandbox to modules", ->
			
			xit "should create a default sandbox instance for the module", ->
				return
				
				