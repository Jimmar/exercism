use std::fmt;

const DAY: i32 = 24;
const HOUR: i32 = 60;

#[derive(PartialEq, Eq, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        // ugly but more readable for me 🤷🏽‍♂️
        let mut new_hours = (hours + minutes.max(0) / HOUR) % DAY;
        let mut new_minutes = minutes;

        while new_minutes < 0 {
            new_minutes += HOUR;
            new_hours -= 1
        }
        while new_hours < 0 {
            new_hours += DAY
        }

        Clock {
            hours: new_hours,
            minutes: new_minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }
}
