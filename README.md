This project is inteded for Vula medical and does the following:

1. Display the colour name
2. Determine all users who voted for this colour.
3. Display the list of users who voted for the colour in sorted order.

To run the program please run dart run bin/main.dart

Answers to questions

**What advantages does this language offer for solving this problem?**

DART is relatively simple language to learn it has advantages such as built-in asynchronous programming that make it easier to handle futures and async work without requiring third party libraries. DART also offers AOT (Ahead of Time) compilation which compiles native code before running it this basically means faster bootstime and execution time when running code. Additionally DARTs type safety allows for easier fault finding by throwing errors at compile time opposed to runtime. 

**In what ways does the language make it more difficult to solve this problem?**

Dart is more verbose and requires more lines of code to achieve similar functionality then other languages like python. Dart does not have a native CSV or TSV splitting functionality that allows for easy string splitting. Python for example has csv module, python additionally is better suited for processing larger datasets.

**Why did you select this particular language to solve the problem?**

I selected DART because it is the language I am most confident in as well as it being closer to the role I am being interviewed for. Also Effective DART programming translates to writing flutter code. 

**Did you do anything to make the solution run faster?**

Yes, I implemented in memory caching where we only ever load the data once, this avoids expensive data retrival calls, additionally I implemented O(1) lookups this makes it easier to find users instead of using linear search I used a hash lookup. 
