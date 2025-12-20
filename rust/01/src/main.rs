use std::fs;

struct Instruction {
    rotation: String,
    clicks: u32,
}

struct Dial {
    position: i32,
}

impl Dial {
    fn step(&mut self, rotation: &String) {
        let delta: i32 = if rotation == "L" { -1 } else { 1 };

        self.position += delta;

        if self.position == 100 {
            self.position = 0;
        } else if self.position == -1 {
            self.position = 99;
        }
    }
}

fn main() -> std::io::Result<()> {
    let input = fs::read_to_string("data/input.txt")?;
    let instructions = parse_instructions(&input);
    let mut dial = Dial { position: 50 };

    let mut zero_landings: u32 = 0;
    let mut zero_passes: u32 = 0;

    for instruction in instructions {
        let mut clicks = instruction.clicks;

        while clicks > 0 {
            dial.step(&instruction.rotation);
            clicks -= 1;
            if clicks > 0 && dial.position == 0 { zero_passes += 1 }
        }

        if dial.position == 0 { zero_landings += 1 }
    }

    println!("Password: {}", zero_landings + zero_passes);
    Ok(())
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
