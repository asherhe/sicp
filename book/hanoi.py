# Initialize towers - a list of stacks
towers = [[], [], []]

def move(a, b):
  """
  Move the top uppermost disk of stack a to stack b
  """
  if len(towers[a]) > 0:
    if len(towers[b]) > 0:
      if towers[a][-1] > towers[b][-1]:
        return False
    towers[b].append(towers[a].pop())
    return True
  return False

def display():
  """
  Display the three stacks
  """
  # print(towers)
  s = ""
  for stack in towers:
    s += " | "
    for disk in stack:
      s += str(disk) + " "
    s += "\n"
  print(s)

def play():
  while True:
    display()
    prompt = input("move:  ").split(" ")
    moves = []
    for i in prompt:
      if i == "quit":
        return
      if i.isdigit():
        moves.append(int(i) - 1)
      if len(moves) == 2:
        break
    move(*moves)

n = int(input("tower size:  "))
towers[0] = list(range(n, 0, -1))
play()
