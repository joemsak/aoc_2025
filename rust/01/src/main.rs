struct Instruction {
    rotation: String,
    clicks: u32,
}

fn main() {
    let input = "L32\nR1";
    let instructions = parse_instructions(input);

    for instruction in instructions {
        println!("rotation: {}, clicks: {}", instruction.rotation, instruction.clicks);
    }
}

fn parse_instructions(list: &str) -> Vec<Instruction> {
    list.lines()
        .filter_map(|line| {
            if let (Some(rot), Some(clicks)) = (line.chars().next(), line.get(1..)) {
                if let Ok(clicks_num) = clicks.parse::<u32>() {
                    return Some(Instruction {
                        rotation: rot.to_string(),
                        clicks: clicks_num,
                    });
                }
            }
            None
        })
        .collect()
}
