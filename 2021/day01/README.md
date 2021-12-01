# Day 1 - Batch

**Status**
Completed and earned a star
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
