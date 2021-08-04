def digital_root(num)
  while num >= 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)

    num /= 10
  end

  root
end

#recursive solution

def digital_root_recur num
  return num if num < 10
  digital_root_recur((num % 10) + (num / 10))
end


#

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a

  encoded_str = ""
  str.each_char do |char|
    if char == " "
      encoded_str << " "
      next
    end

    old_idx = letters.find_index(char)
    new_idx = (old_idx + shift) % letters.count

    encoded_str << letters[new_idx]
  end

  encoded_str
end


def longest_common_substring(str1, str2)
  longest_substring = ""

  start_idx = 0
  while start_idx < str1.length
    # don't consider substrings that would be too short to beat
    # current max.
    len = longest_substring.length + 1

    while (start_idx + len) <= str1.length
      end_idx = start_idx + len
      substring = str1[start_idx...end_idx]
      longest_substring = substring if str2.include?(substring)

      len += 1
    end

    start_idx += 1
  end

  longest_substring
end


def make_matrix(str1, str2)
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  str1.chars.each_with_index do |el1, idx1|
    str2.chars.each_with_index do |el2, idx2|
      if el1 == el2
        matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
      else
        matrix[idx1 + 1][idx2 + 1] = 0
      end
    end
  end

  matrix
end

def longest_common_substring(str1, str2)
  matrix = make_matrix(str1, str2)
  greatest_substring = ""
  matrix.each_with_index do |row, idx1|
    row.each_with_index do |length, idx2|
      if length > greatest_substring.length
        greatest_substring = str2[idx2 - length...idx2]
      end
    end
  end

  greatest_substring
end


#   |"" | C | A | T  
#--------------------
#"" | 0 | 0 | 0 | 0
#--------------------
#R  | 0 | 0 | 0 | 0
#--------------------
#A  | 0 | 0 | 1 | 0
#--------------------
#T  | 0 | 0 | 0 | 2  <--- Longest substring ends here!

def sum_rec(nums)
  return 0 if nums.empty?
  nums[0] + sum_rec(nums.drop(1))
end

def fibs(num)
  return [] if num == 0
  return [0] if num == 1

  fibs = [0, 1]
  while fibs.count < num
    fibs << fibs[-1] + fibs[-2]
  end

  fibs
end

def fibs(num)
  return [] if num == 0
  return [0] if num == 1
  return [0, 1] if num == 2

  prev_fibs = fibs(num - 1)
  prev_fibs << prev_fibs[-1]  + prev_fibs[-2]

  prev_fibs
end