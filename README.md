Bowling Game KATA
=================

A version of bowling game with specs

Environment:
=================

Ruby 1.8.7 (should work for 1.9.3 also)
Rspec 2

Structure
=========
  - lib
      bowling_game.rb      # => Bowling game score calculation
      frame.rb             # => generic Frame class with sub types
      sample.rb            # => sample of inputs   
  - spec
      bowling_game_rspec.rb  # => rspec tests
  README.txt
  example.rb               # => code to run program and to see outputs for sample edge cases in sample.rb file
  

== Assumptions

      I rely on following assumptions base on your email and what I've got form Bowling game rules:

      * Valid rolls 
      * The input to your program is an array of arrays of integers. The program itself will support an array of arrays([[],[],[]]) and flat array [1,3,4,..]. But example.rb file was constructed only for what you requested for this task: an array of arrays.
      * Correct number of rolls and frames.
      * No need for error-checking the input data
      * All Strike sub-array except final frame would have one element in sub-array. 
      [[10],[3,4],........[10,3,0]]   - [10] expected input data
      [[10,0],[3,4],........[2,3]]    - [10,0] is not supported by this program for any strike frame except final

   The program Bowling score calculation for classic ten-frame bowling game and 2 throws in each frame except last one where could be 3 throws due to strike or spare throw.
 
      
== How to run program

  Open root folder of bowling_game in terminal and run below commands:
 
 1. To run Rspec test

    rspec spec/bowling_game_rspec.rb -f d      
    
 2. To see some score per each frame for sample input data run following command:
    
    ruby example.rb    # => Result are formatted into simple table without border and would be printed into console
    
    Output:
    
    Frame                     User almost_perfect       Score                    
    1                         10                        30                       
    2                         10                        60                       
    3                         10                        90                       
    4                         10                        120                      
    5                         10                        150                      
    6                         10                        180                      
    7                         10                        210                      
    8                         10                        230                      
    9                         10                        240                      
    10                        0 0                       240                      
    Total Score: 240

    Frame                     User gutter               Score                    
    1                         0 0                       0                        
    2                         0 0                       0                        
    3                         0 0                       0                        
    4                         0 0                       0                        
    5                         0 0                       0                        
    6                         0 0                       0                        
    7                         0 0                       0                        
    8                         0 0                       0                        
    9                         0 0                       0                        
    10                        0 0                       0                        
    Total Score: 0
     
    ...
    
  By adding new data into TABLE (lib/sample.rb) you will see more results when you run example.rb file.
    
