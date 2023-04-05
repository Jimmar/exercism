use std::collections::HashSet;

fn sort_chars(s: &str) -> Vec<char> {
    let mut chars = s.to_lowercase().chars().collect::<Vec<char>>();
    chars.sort_unstable();
    chars
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let sorted_word = sort_chars(word);

    possible_anagrams
        .iter()
        .filter(|anagram| anagram.to_lowercase() != word.to_lowercase())
        .filter(|anagram| sort_chars(anagram) == sorted_word)
        .copied()
        .collect()
}
