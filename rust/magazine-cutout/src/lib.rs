use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut magazine_words = HashMap::new();

    for word in magazine {
        *magazine_words.entry(word).or_insert(0) += 1;
    }

    for word in note {
        if !magazine_words.contains_key(word) || magazine_words[word] == 0 {
            return false;
        }
        magazine_words.entry(word).and_modify(|e| *e -= 1);
    }

    true
}
