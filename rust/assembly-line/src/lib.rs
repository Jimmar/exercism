static CARS_PER_SPEED: f64 = 221.0;

pub fn production_rate_per_hour(speed: u8) -> f64 {
    let rate = speed as f64 * CARS_PER_SPEED;
    match speed {
        5..=8 => rate * 0.9,
        9..=10 => rate * 0.77,
        _ => rate,
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    production_rate_per_hour(speed) as u32 / 60
}
