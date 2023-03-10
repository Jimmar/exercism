use std::vec;

#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    use CalculatorInput::*;
    let mut stack: Vec<i32> = Vec::new();
    for input in inputs {
        match (input, stack.pop(), stack.pop()) {
            (Value(n), None, None) => stack.push(*n),
            (Value(n), Some(y), None) => stack.extend(vec![y, *n]),
            (Value(n), Some(y), Some(x)) => stack.extend(vec![x, y, *n]),
            (Add, Some(y), Some(x)) => stack.push(x + y),
            (Subtract, Some(y), Some(x)) => stack.push(x - y),
            (Multiply, Some(y), Some(x)) => stack.push(x * y),
            (Divide, Some(y), Some(x)) => stack.push(x / y),
            _ => return None,
        }
    }

    match stack.len() {
        1 => stack.pop(),
        _ => None,
    }
}
