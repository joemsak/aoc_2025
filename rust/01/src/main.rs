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
            let mut chars = line.chars();
            let rot = chars.next()?;
            let clicks_num: u32 = chars.as_str().parse().ok()?;
            Some(Instruction {
                rotation: rot.to_string(),
                clicks: clicks_num,
            })
        })
        .collect()
}
