dirs = ["R4", "R5", "L5", "L5","L3","R2","R1","R1","L5","R5","R2","L1","L3","L4","R3","L1","L1","R2","R3","R3","R1","L3","L5","R3","R1","L1","R1","R2","L1","L4","L5","R4","R2","L192","R5","L2","R53","R1","L5","R73","R5","L5","R186","L3","L2","R1","R3","L3","L3","R1","L4","L2","R3","L5","R4","R3","R1","L1","R5","R2","R1","R1","R1","R3","R2","L1","R5","R1","L5","R2","L2","L4","R3","L1","R4","L5","R4","R3","L5","L3","R4","R2","L5","L5","R2","R3","R5","R4","R2","R1","L1","L5","L2","L3","L4","L5","L4","L5","L1","R3","R4","R5","R3","L5","L4","L3","L1","L4","R2","R5","R5","R4","L2","L4","R3","R1","L2","R5","L5","R1","R1","L1","L5","L5","L2","L1","R5","R2","L4","L1","R4","R3","L3","R1","R5","L1","L4","R2","L3","R5","R3","R1","L3"]


defmodule Direction do
  def get_direction([head|tail], current, x, y) do
    [dir, len] = case head do
      "R" <> rest when current == "N" -> ["E", rest]
      "R" <> rest when current == "E" -> ["S", rest]
      "R" <> rest when current == "S" -> ["W", rest]
      "R" <> rest when current == "W" -> ["N", rest]
      "L" <> rest when current == "N" -> ["W", rest]
      "L" <> rest when current == "W" -> ["S", rest]
      "L" <> rest when current == "S" -> ["E", rest]
      "L" <> rest when current == "E" -> ["N", rest]
      _ -> ""
    end
    len = String.to_integer(len)
    case dir do
      "N" -> get_direction(tail, dir, x, y+len)
      "S" -> get_direction(tail, dir, x, y-len)
      "E" -> get_direction(tail, dir, x+len, y)
      "W" -> get_direction(tail, dir, x-len, y)
    end
  end
  def get_direction([], current, x, y) do
    IO.puts abs(x)+abs(y)
  end
end

Direction.get_direction(dirs, "N", 0, 0)
