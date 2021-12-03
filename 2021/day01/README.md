# Day 1 - Batch

**Status**
Completed and earned two stars for part 1 and 2
![One Whole Gold Star](https://i.imgur.com/lgqZASO.png)

Boy oh boy, I forgot how annoying batch is. There are a lot of stupid little rules and issues that you have to work around. But the problem is, you don't even know what you're doing wrong until you read some documentation or solution online to get around an issue. I'm going to list some issues I've ran into while writing the batch script.

## Problems with using variables in for loops

I was not able to use variables inside the for loop reliably or even at all. Wasn't sure what I was doing wrong because the syntax was correct. Turns out that you have to do `setlocal EnableDelayedExpansion` so the variables are processed during execution time instead of when it gets parsed.

Problem with for loops is that it's technically one command. So even thought it's processing many things inside the loop. It counts as one execution so it parses the variables before the runtime. So in order to make variables useful, you have to make it so the variables are handled in "realtime" during execution.

TL;DR;
In for loops, use `setlocal EnableDelayedExpansion`. After that, don't use %'s like `%someVariable%` in for loops. Use `!someVariable!` instead to process variables in realtime during execution.
<details>
<summary>Example Code</summary>

```batch
@echo off
echo This is borked

set counter=0
for /l %%i in (1,1,10) do (
    set /a counter=%counter%+1
    echo Counter: %counter%
)

echo Now it should work
setlocal EnableDelayedExpansion

set counter=0
for /l %%i in (1,1,10) do (
    set /a counter=!counter!+1
    echo Counter: !counter!
)
```
    
</details>

## Escape brackets
Syntax for batch is very forgiving. Not necessarily a good thing imo. I had a problem when printing ) with the echo command. Just escape it with `^` like `^)`. Otherwise it will complain that it was expecting a bracket at some place or wasn't expecting a bracket or something.

## Functions
So I guess I learned how to use "functions" in batch. Well, a VERY janky way to do it.

You're just using labels as functions which is really jank. You can technically pass arguments to functions by using `call :someFunction %var1% %var2% etc` **BUT** this doesn't work if you use variables that is an array. In this case, you just have to access the variable like normal. Because I'm already accessing variables without passing them as arguments. I just didn't bother using arguments at all. Yuck.

## Arrays
So, arrays are really stupid in batch. Since you can't get the length of an array, you have to loop through the array and add 1 to a variable for each pass in the loop.

# CONCLUSION
Batch was just awful... Which was to be expected. I mean, it's fine when you do simpler things but to actually use it as a full on scripting thing. Why would you want to do this to yourself?

When you'd expect things to work one way. It just doesn't works because of another issue. Sometimes, things don't parse properly at all such as `echo !data[!d1!]! !data[!d2!]! !data[!d3!]!`. It doesn't give you the value of the array and it just prints `d1 d2 d3` for some reason.
