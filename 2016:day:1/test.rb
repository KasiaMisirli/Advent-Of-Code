# directions

input = "L1, L3, L5, L3, R1, L4, L5, R1, R3, L5, R1, L3, L2, L3, R2, R2, L3, L3, R1, L2, R1, L3, L2, R4, R2, L5, R4, L5, R4, L2, R3, L2, R4, R1, L5, L4, R1, L2, R3, R1, R2, L4, R1, L2, R3, L2, L3, R5, L192, R4, L5, R4, L1, R4, L4, R2, L5, R45, L2, L5, R4, R5, L3, R5, R77, R2, R5, L5, R1, R4, L4, L4, R2, L4, L1, R191, R1, L1, L2, L2, L4, L3, R1, L3, R1, R5, R3, L1, L4, L2, L3, L1, L1, R5, L4, R1, L3, R1, L2, R1, R4, R5, L4, L2, R4, R5, L1, L2, R3, L4, R2, R2, R3, L2, L3, L5, R3, R1, L4, L3, R4, R2, R2, R2, R1, L4, R4, R1, R2, R1, L2, L2, R4, L1, L2, R3, L3, L5, L4, R4, L3, L1, L5, L3, L5, R5, L5, L4, L2, R1, L2, L4, L2, L4, L1, R4, R4, R5, R1, L4, R2, L4, L2, L4, R2, L4, L1, L2, R1, R4, R3, R2, R2, R5, L1, L2"


# original position
$x = 0
$y = 0
def split_input(input)
  input.gsub(/\s+/, "").split(",").map{|move| 
    dir = move.split("")}
end
# [["R", "5"], ["L", "5"], ["R", "5"], ["R", "3"]]
# 1. update direction
$current_dir = 0
def update_direction(letter)
  directions = {
    N: "N",
    E: "E",
    S: "S",
    W: "W"
  }
  if letter == "R"
    $current_dir += 1
  elsif letter == "L"
    $current_dir -= 1
  end
  current_dir2 = $current_dir % directions.length
  directions.keys[current_dir2].to_s
end

# 2. update position

def update_position(direction,number,x,y)
  # print direction
  if direction.eql? "E" 
    # print "east"
    new_x = x + number
  elsif direction.eql? "W" 
    new_x = x - number
  elsif direction.eql? "N" 
    new_y = y + number
  elsif direction.eql? "S" 
    new_y = y - number
  end
  if new_x.nil?
    new_x = x
  end
  if new_y.nil?
    new_y = y
  end
  return new_x, new_y
end


def run(input)
  array = split_input(input)
  x = 0
  y = 0
  array.map {|each|
    up_direction = update_direction(each[0])
    # print each[1]
    outcome = update_position(up_direction,each[1].to_i,x,y)
    # print outcome
    x = outcome[0]
    y = outcome[1]
  }
  print x.abs + y.abs
end

run(input)
