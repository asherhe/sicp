# Case Study: Tower of Hanoi
#lecture

**Python program (no auto solve thing):**
![](hanoi.py)

Basically the whole algorithm is:

```
to move a block of disks:
  move all but the bottom to the spare stack
  move the bottom disk to destination
  move the contents of the spare stack to the destination
```

Hint: The function definition is `(move n from to spare)`, where `n` is the number of blocks to move.

This is a recursive algorithm

**Challenge: Write an iterative version**