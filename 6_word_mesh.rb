=begin
Input: array of strings with at least two strings
Output: string, meshed wors or "failed to mesh"
Rules: if two strings mesh, at least one letter but could be more. could one of the elements be an empty string? or just one letter?
Problem: compare the first word to the second. Select all letters that are the same from the first word, hold on to those letters that are the same as the beginning of the second word. Then compare the second word to the third, etc.
Put all the "same" letters together.
If one of the words doesn't have substring from the end of the first word as compared to the beginning of the second word in common, return 'failed to mesh'

DS: strings, arrays

Algo:
define a method word_mesh that takes one param, arr
initialize lv results, assign to empty string object
iterate over the words, params word, index. stop at second to last element.

  initialize new lv called word2, point to reference arr[index + 1]. lv word1, set to word.
  letter_index, set to 1.

  call loop
  is reference of character at negative letter_index of word2 nil? 
    add word2 to results and break unless second word is empty string. then return 'failed to mesh'
  is it the same as the negative letter_index of the first word?
    if yes, increment letter_index by 1.
    if not, 
      is the negative (letter_index + 1) of word2 truthy?
        reset word1 to word
      is word2 string empty?
        return 'failed to mesh'
      otherwise, permanently delete the letter from both word1 and word2.

  return results
=end

def word_mesh(arr)
  results = ''
  index = 0

  arr.each_with_index do |word, index|
    next if arr[index + 1] == nil
    word1, word2 = word.chars, arr[index + 1].chars
    letter_index = 1

    loop do
      if word2[-letter_index] == nil
        return 'failed to mesh' if word2.empty?
        results << word2.join
        break
      elsif word2[-letter_index] == word1[-letter_index]
        letter_index += 1
      elsif word2[-letter_index]
        word1 = word
        letter_index = 1
        word2.slice!(-letter_index)
      else
        return 'failed to mesh' if word2.empty?
        word1.slice!(-letter_index)
        word2.slice!(-letter_index)
      end
    end
  end
  results
end

p word_mesh(["allow", "lowering", "ringmaster", "terror"]) == "lowringter"

p word_mesh(["kingdom", "dominator", "notorious", "usual", "allegory"]) == "failed to mesh"
