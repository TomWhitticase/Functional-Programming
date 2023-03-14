{-
---- Part 1 ----
--a) Explain three real world applications developed with Haskell.

Sigma by Facebook
Sigma is a piece of software developed by facebook to prevent spam and fraud on their site.
It was written in their own language FXL which was slow and lacked features such as modules
and user-defined data types, so in 2015 they redesigned it using Haskell. The system was 3
times faster using Haskell. Sigma checks every activity on facebook for fraud or spam. It uses
policies to decide if an activity is bad. If an activity is identified as being bad it will
be blocked.

Cardano SL
Cardano Settlement Layer is a cryptocurrency made for the Cardano blockchain platform developed
by IOHK. It was designed to be a better version of bitcoin by fixing some of bitcoins flaws.
Cardano is a proof of stake(PoS) cryptocurrency whereas Bitcoin is a proof of work(PoW) cryptocurrency.
PoW uses a lot more electricity per transaction than Pos so Cardano is more environmentally sustainable.
Haskell was chosen as it is a functional programming language which makes it well suited for programs
that require reliable formal verification.

Pandoc
Pandoc is an open-source document converter that can convert files. It takes a document in one of the
supported formats and converts its markup into another format. Pandoc can be used as a haskell library
for anyone to write their own conversion tools or web applications.

--b) List and explain four benefits that Functional Programming brings to programmers.

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

--c) Explain in your own words what a (mathematical) function is and discuss to what extent
Haskell functions resemble mathematical functions (use examples to support your
answer).

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
-}

---- Part 2 ----
{-(a)Define the type Dog which is a 2-tuple consisting of a String (the dog’s name) and an Int
(the dog’s height in centimetres).-}
type Dog = (String,Int)

{-(b)Write a function create_dog_list :: [String] -> [Int] -> [Dog] that gets a list of names and a
list of heights and pairs them one by one to create a list of Dogs.-}

--create_dog_list takes in a list of strings (dog names) and a list of integers (dog heights) and puts the lists together to output a list of tuples (dog name and dog height)
create_dog_list :: [String] -> [Int] -> [Dog]
create_dog_list xs [] = []
create_dog_list [] ys = []
create_dog_list (x:xs) (y:ys) = (x, y) : create_dog_list xs ys

{-(c)Write a function sort_dog_list :: [Dog] -> [Dog] that sorts a list of Dogs by their height in
ascending order.
Hint: You can alter merge_sort or quick_sort from the lecture.-}

--function takes in list of dogs and performs an insertions sort using the dogs height to output list of dogs ordered by height
sort_dog_list :: [Dog] -> [Dog]
sort_dog_list [] = []
sort_dog_list [b] = [b]
sort_dog_list (x:y) = 
 insert_dog x (sort_dog_list y)

--helper function which takes in a Dog and a list of dogs and inserts the dog into the correct place in the ordered dog list
insert_dog :: Dog -> [Dog] -> [Dog]
insert_dog e [] = [e]
insert_dog e (x:y)
 | snd x >= snd e = e:x:y
insert_dog e (x:y)
 | snd x < snd e = x : (insert_dog e y)
 
{-(d)Write a function remove_smallest_dogs :: Int -> [Dog] -> [Dog] that gets an integer k and a
list of Dogs and removes the k smallest Dogs from that list. (You are allowed to change
the order of the Dogs in the resulting list.)-}

--function uses sort_dog_list to order a list of dogs by height then uses drop to remove the smallest k elements where k is an inputed integer
remove_smallest_dogs :: Int -> [Dog] -> [Dog]
remove_smallest_dogs k xs = drop k (sort_dog_list xs)

{-(e)Write a function remove_tall_dogs :: [Dog] -> [Dog] that removes all Dogs from a list of
Dogs that are taller than 80cm. To get full marks, use list comprehension.-}

--function takes in a list of Dogs and removes any dogs with height over 80 using list comprehension
remove_tall_dogs :: [Dog] -> [Dog]
remove_tall_dogs xs = [(fst a, snd a) | a <-xs, 80 >= snd a]

---- Part 3 ----
{-(a)Define a function steps that takes three positive Int values m n p and returns a String that
can be displayed as p steps, of height m and width n+n (n spaces followed by n asterisks), the
right way up, and repeats the pattern in opposite way.-}

--function that takes in 3 integers and outputs a string forming a pattern of steps with size and amount of steps given by input values
steps :: Int -> Int -> Int -> String
steps m n p = get_forward_steps m n p ++ get_reverse_steps m n p

--fucntion gets a row of the step pattern 
get_rows :: Int -> Int -> Int -> String
get_rows x y z =
 if x == 0
	then [' ' | a <- [1..y]] ++ ['*'| a <- [1..y]]
 else if mod x z == 0
	then [' ' | a <- [1..y]] ++ (get_rows (x-1) y z) ++ ['*'| a <- [1..y]]
 else get_rows (x-1) y z
	
--function gets the top half of the steps pattern
get_forward_steps :: Int -> Int -> Int -> String
get_forward_steps m n p = concat [(get_rows a n m) ++ "\n" | a <- [0..(m * p) - 1 ]]
 
--function gets the bottom half of the steps pattern
get_reverse_steps :: Int -> Int -> Int -> String
get_reverse_steps m n p =
 concat (reverse [(get_rows a n m) ++ "\n" | a <- [0..(m * p) -1] ])	
  
{-(b)Define a function flagpattern that takes two positive Int values n greater than or equal to 5,
and m greater than or equal to 1, and returns a String that can be displayed as the following m
'flag' patterns of dimension n.-}

--fucntion gets a flag pattern of a given size and repeats it a given amount of times
flagpattern :: Int -> Int -> String
flagpattern n m 
 |n < 5 = "n must be greater than or equal to 5"
 |m < 1 = "m must be greater than or equal to 1"
 |n `mod` 2 /= 0 = repeat_flag (replicate n '*' ++ "\n" ++ flag_top 0 m n ++ flag_middle_line n ++ flag_bottom ((div n 2) -2) m n ++ replicate n '*') m 
 |otherwise = repeat_flag (replicate n '*' ++ "\n" ++ flag_top 0 m n  ++ flag_bottom ((div n 2) -2) m n ++ replicate n '*') m

--function to repeat a flag pattern
repeat_flag :: String -> Int -> String
repeat_flag s n
 |n == 1 = s
 |otherwise = s ++ ['\n'] ++ repeat_flag s (n-1)
 
--function gets the middle line of the flag pattern if needed
flag_middle_line :: Int -> String
flag_middle_line n =
 ['*'] ++ replicate ((div n 2) -1) ' ' ++ ['+'] ++ replicate ((div n 2) -1) ' ' ++ "*\n"
  
--function gets the top half of the flag pattern
flag_top :: Int -> Int -> Int -> String
flag_top n m x
 |n == (div x 2) -1 = ""
 |otherwise = ['*'] ++ replicate n ' ' ++
  ['+'] ++ replicate ((x-2)-(2*n)-2) ' ' ++
   ['+'] ++ replicate n ' ' ++ "*\n" ++ (flag_top (n+1) m x)
 
--function gets the bottom half of the flag pattern
flag_bottom :: Int -> Int -> Int -> String
flag_bottom n m x
 |n == -1 = ""
 |otherwise = ['*'] ++ replicate n ' ' ++
  ['+'] ++ replicate ((x-2)-(2*n)-2) ' ' ++ ['+']
   ++ replicate n ' ' ++ "*\n" ++ (flag_bottom (n-1) m x)
   
---- Part 4 ----
{-Define a function compatibility, that takes two String values representing persons names, and
outputs their compatibility-}

--function gets that compatibility (likes, admires, hates, is indifferent to) between 2 people's names
compatibility :: String -> String -> String
compatibility a b =
 a ++ " " ++ lahi (remove_elements a b) ++ " " ++ b ++ " and "
  ++ b ++ " " ++ lahi (remove_elements b a) ++ " " ++ a

--function removes the characters that appear in one string from another string
remove_elements :: String -> String -> String
remove_elements x y = [a | a <-x, notElem a y]

--function removes space characters from string
remove_spaces :: String -> [Char]
remove_spaces x = [a | a <- x, a /= ' ']

--function takes in a name that has had the like characters removed and decides if the person likes, admires, hates, or is indifferent to the other person
lahi :: String -> String
lahi x =
 if mod (length (remove_spaces x)) 4 == 1
  then "likes"
 else if mod (length (remove_spaces x)) 4 == 2
  then "admires"
 else if mod (length (remove_spaces x)) 4 == 3
  then "hates"
 else "is indifferent to"

---- Part 5 ----
{-Define a polymorphic function nsplit that is applied to two arguments of types [a] and a, where a
is a type on which == is defined, and partitions the original list at occurrences of the second
argument and returns a list of int values of the number of elements for each part-}

--function takes in a list and a element and splits the list by given element returning a list of the lengths of the parts of the split list
nsplit :: (Eq a) => [a] -> a -> [Int]
nsplit x y = map length (filter (/=[])(split_at y x))

--function splits a list at a given element
split_at :: Eq a => a -> [a] -> [[a]]
split_at a []  = []
split_at a xs = (fst (span (/= a) xs)) :(split_at a (drop 1 (snd (span (/= a) xs))))
	


