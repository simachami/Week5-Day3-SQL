# DESCRIPTION:
# In this exercise, your goal is to write a function which will reverse the vowels in a string. Any characters which are not vowels should remain in their original position. Here are some examples:

# "Hello!" => "Holle!"
# "Tomatoes" => "Temotaos"
# "Reverse Vowels In A String" => "RivArsI Vewols en e Streng"
# For simplicity, you can treat the letter y as a consonant, not a vowel.
import re
def reverse_vowels(s):
    pattern = '[aeiouAEIOU]'
    result = re.sub(pattern, lambda match: match.group(0)[::-1], s)
    return result


def reverse_vowels(s):
    vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'}
    vowel_chars = [char for char in s if char in vowels]
    reversed_vowels = vowel_chars[::-1]
    result = [char if char not in vowels else reversed_vowels.pop() for char in s]
    return ''.join(result)

#david's solution
def vowel_reverse(string):
    vowels = 'aeiouAEIOU'
    alist = list(string)
    left = 0
    right = len(string) - 1
    while left <= right:
        if alist[left] in vowels and alist[right] in vowels:
            alist[left], alist[right] = alist[right], alist[left]
            left += 1
            right -= 1
        elif alist[left] in vowels:
            right -= 1
        elif alist[right] in vowels:
            left += 1
        else:
            left += 1
            right -= 1
    return ''.join(alist)
print(vowel_reverse("Reverse Vowels In A String"))
print(vowel_reverse("Tomatoes"))
print(vowel_reverse("Hello"))