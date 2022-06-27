---
date created: 2022/06/21 9:18:38 pm
date modified: 2022/06/24 10:02:45 pm
---
# Case Study: Tower of Hanoi

#lecture #case-study

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

This is a recursive algorithm, particular one that employs [[Recursion and Iteration#Tree Recursion|tree recursion]], which is quite inefficient.

**Challenge: Write an iterative version**
