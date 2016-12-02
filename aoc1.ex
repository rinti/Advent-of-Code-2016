dirs = ["R4", "R5", "L5", "L5","L3","R2","R1","R1","L5","R5","R2","L1","L3","L4","R3","L1","L1","R2","R3","R3","R1","L3","L5","R3","R1","L1","R1","R2","L1","L4","L5","R4","R2","L192","R5","L2","R53","R1","L5","R73","R5","L5","R186","L3","L2","R1","R3","L3","L3","R1","L4","L2","R3","L5","R4","R3","R1","L1","R5","R2","R1","R1","R1","R3","R2","L1","R5","R1","L5","R2","L2","L4","R3","L1","R4","L5","R4","R3","L5","L3","R4","R2","L5","L5","R2","R3","R5","R4","R2","R1","L1","L5","L2","L3","L4","L5","L4","L5","L1","R3","R4","R5","R3","L5","L4","L3","L1","L4","R2","R5","R5","R4","L2","L4","R3","R1","L2","R5","L5","R1","R1","L1","L5","L5","L2","L1","R5","R2","L4","L1","R4","R3","L3","R1","R5","L1","L4","R2","L3","R5","R3","R1","L3"]


defmodule Direction do
  def get_distance([head|tail], direction, x, y) do
    [direction, steps] = case head do
      "R" <> rest when direction == "N" -> ["E", rest]
      "R" <> rest when direction == "E" -> ["S", rest]
      "R" <> rest when direction == "S" -> ["W", rest]
      "R" <> rest when direction == "W" -> ["N", rest]
      "L" <> rest when direction == "N" -> ["W", rest]
      "L" <> rest when direction == "W" -> ["S", rest]
      "L" <> rest when direction == "S" -> ["E", rest]
      "L" <> rest when direction == "E" -> ["N", rest]
    end
    steps = String.to_integer(steps)
    case direction do
      "N" -> get_distance(tail, direction, x, y+steps)
      "S" -> get_distance(tail, direction, x, y-steps)
      "E" -> get_distance(tail, direction, x+steps, y)
      "W" -> get_distance(tail, direction, x-steps, y)
    end
  end
  def get_distance([], direction, x, y) do
    IO.puts abs(x)+abs(y)
  end
end

Direction.get_distance(dirs, "N", 0, 0)
