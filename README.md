# Functional Programming

Some basic haskell programs demonstrating functional programming concepts

## About functional programming

### Use of Haskell in Industry
#### Sigma by Facebook
Sigma is a piece of software developed by facebook to prevent spam and fraud on their site.
It was written in their own language FXL which was slow and lacked features such as modules
and user-defined data types, so in 2015 they redesigned it using Haskell. The system was 3
times faster using Haskell. Sigma checks every activity on facebook for fraud or spam. It uses
policies to decide if an activity is bad. If an activity is identified as being bad it will
be blocked.
#### Cardano SL
Cardano Settlement Layer is a cryptocurrency made for the Cardano blockchain platform developed
by IOHK. It was designed to be a better version of bitcoin by fixing some of bitcoins flaws.
Cardano is a proof of stake(PoS) cryptocurrency whereas Bitcoin is a proof of work(PoW) cryptocurrency.
PoW uses a lot more electricity per transaction than Pos so Cardano is more environmentally sustainable.
Haskell was chosen as it is a functional programming language which makes it well suited for programs
that require reliable formal verification.
#### Pandoc
Pandoc is an open-source document converter that can convert files. It takes a document in one of the
supported formats and converts its markup into another format. Pandoc can be used as a haskell library
for anyone to write their own conversion tools or web applications.

### The Benefits of Functional Programming
1. Pure functions always have the same output for the same inputs.
The return value of a pure function is always the same if input values are kept constant.
Pure functions do not have any side effects. No other variables can be changed by the function.
Using pure functions ensures that any variables that will be changed are clearly declared in the signature.
This makes the function very easy to read and understand what variables it will affect.
2. Programs are quicker to compile as recursion is used rather than loops.
Functional languages do not support any kind of loops such as for loops or while loops.
This means programs must be written using recursion instead which makes the code much
closer to assembly code. Interpereters require lots of code to initialise loops so by using recursion instead
the interpereter execute code much faster.
3. Functional programming produces less bugs.
Every function is a mapping of inputs to outputs without any side effects. All variables are immutable.
This ensures that if a function works for any given inputs then there are no other conditions that
could cause problems.
4. Functions have signatures.
The signature of the function declares the types of inputs and outputs. This makes functions very readable and
easy to reason. The signatures of functions provide programmers with a clearer idea of what the function does.

### Pure Functions in Haskell
A function is a mapping of one set of values to another set of values. It recieves inputs and performs
instructions on the input data to calculate output values. Haskell functions are pure functions which means
that if the inputs are kept the same then the outputs will be constant. Haskell functions closely resemble
mathematical functions as they are a mapping of inputs to outputs without any side effects or influencing data
other than the clearly declared inputs and output. In other programming languages, such as OOP languages,
functions can have varying outputs even when the input values are kept constant. They can also manipulate
other variables throughout the program.
examples:
	mathematical function:
		f(x) = 2x + 1
	written in haskell:
		f :: Int -> Int
		f x = 2 * x + 1
		
	mathematical function:
		g(x) = x - yx
	written in haskell:
		g :: Int -> Int -> Int
		g x y = x - (y * x)

