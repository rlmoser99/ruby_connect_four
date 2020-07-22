# lib/board.rb -- 12 warnings:

[8]:Attribute: Board#board is a writable attribute 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
x Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable.

[56, 60]:DuplicateMethodCall: Board#diagonal_victory? calls 'coords[0]' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[56, 60]:DuplicateMethodCall: Board#diagonal_victory? calls 'coords[1]' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[75, 77]:FeatureEnvy: Board#find_empty_spot refers to 'row_index' more than self (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Feature-Envy.md]
x Completed

[84]:LongParameterList: Board#diagonal_array has 4 parameters 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Long-Parameter-List.md]
-> IGNORE FOR NOW

[49]:NestedIterators: Board#column_victory? contains iterators nested 2 deep 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Nested-Iterators.md]
x Completed

[36]:NestedIterators: Board#full? contains iterators nested 2 deep 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Nested-Iterators.md]
x Completed

[42]:NestedIterators: Board#row_victory? contains iterators nested 2 deep 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Nested-Iterators.md]
x Completed

[54]:TooManyStatements: Board#diagonal_victory? has approx 7 statements 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Statements.md]
x Method needs to be simplified/shortened. Create helper method?

[49]:UncommunicativeVariableName: Board#column_victory? has the variable name 'n' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Variable-Name.md]
x Do not use 1 or 2 in variable names

[42]:UncommunicativeVariableName: Board#row_victory? has the variable name 'n' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Variable-Name.md]
x Do not use 1 or 2 in variable names

[80]:UtilityFunction: Board#connect_four? doesn't depend on instance state (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
x Completed

# lib/display.rb -- 11 warnings:

[32]:ControlParameter: Display#chip_color is controlled by argument 'number' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Control-Parameter.md]
-> IGNORE FOR NOW

[79, 89]:DuplicateMethodCall: Display#display_board calls 'puts '|----+----+----+----+----+----+----|'' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[28, 28]:FeatureEnvy: Display#display_turn_prompt refers to 'player' more than self (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Feature-Envy.md]
-> IGNORE FOR NOW

[82]:NestedIterators: Display#display_board contains iterators nested 2 deep 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Nested-Iterators.md]
x Completed

[6]:TooManyConstants: Display has 10 constants 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Constants.md]
x Completed

[78]:TooManyStatements: Display#display_board has approx 10 statements 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Statements.md]
x Method needs to be simplified/shortened. Create helper method?

[51]:UncommunicativeParameterName: Display#display_play_again has the parameter name 'player1' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Parameter-Name.md]
x Completed

[51]:UncommunicativeParameterName: Display#display_play_again has the parameter name 'player2' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Parameter-Name.md]
x Completed

[31]:UtilityFunction: Display#chip_color doesn't depend on instance state (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
-> IGNORE FOR NOW

[51]:UtilityFunction: Display#display_play_again doesn't depend on instance state (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
-> IGNORE FOR NOW

[43]:UtilityFunction: Display#display_winner doesn't depend on instance state (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
-> IGNORE FOR NOW

# lib/game.rb -- 14 warnings:

[8]:Attribute: Game#board is a writable attribute 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
x Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable.

[8]:Attribute: Game#current_player is a writable attribute 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
x Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable.

[8]:Attribute: Game#player1 is a writable attribute 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
x Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable.

[8]:Attribute: Game#player2 is a writable attribute 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Attribute.md]
x Make @instance_variable an attr_reader only. Create a method inside that Class that receives a message to update the @instance_variable.

[81, 85]:DuplicateMethodCall: Game#game_over calls '@column.downcase == 'exit'' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[81, 85]:DuplicateMethodCall: Game#game_over calls '@column.downcase' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[81, 84]:DuplicateMethodCall: Game#game_over calls 'board.full?' 2 times 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Duplicate-Method-Call.md]
x Refactor code to not need to call same thing multiple times.

[6]:InstanceVariableAssumption: Game assumes too much for instance variable '@column' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Instance-Variable-Assumption.md]
x Put @instance_variables in initialize method

[6]:InstanceVariableAssumption: Game assumes too much for instance variable '@current_player' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Instance-Variable-Assumption.md]
x Put @instance_variables in initialize method

[6]:TooManyInstanceVariables: Game has at least 5 instance variables 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Instance-Variables.md]
x Completed

[34]:TooManyStatements: Game#turn_order has approx 8 statements 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Too-Many-Statements.md]
-> IGNORE FOR NOW

[17]:UncommunicativeVariableName: Game has the variable name '@player1' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Variable-Name.md]
x Do not use 1 or 2 in variable names

[18]:UncommunicativeVariableName: Game has the variable name '@player2' 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Uncommunicative-Variable-Name.md]
x Do not use 1 or 2 in variable names

[72]:UtilityFunction: Game#valid_input? doesn't depend on instance state (maybe move it to another class?) 
[https://github.com/troessner/reek/blob/v6.0.1/docs/Utility-Function.md]
-> IGNORE FOR NOW

# 37 total warnings