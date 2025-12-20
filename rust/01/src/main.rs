use std::fs;

struct Instruction {
    rotation: String,
    clicks: u32,
}

struct Dial {
    position: i32,
    zero_landings: u32,
    zero_passes: u32,
}

impl Dial {
    fn turn(&mut self, instruction: Instruction) {
        let mut clicks = instruction.clicks;

        while clicks > 0 {
            let delta: i32 = if instruction.rotation == "L" { -1 } else { 1 };

            self.position += delta;

            if self.position == 100 {
                self.position = 0;
            } else if self.position == -1 {
                self.position = 99;
            }

            clicks -= 1;

            if clicks > 0 && self.position == 0 { self.zero_passes += 1 }
        }

        if self.position == 0 { self.zero_landings += 1 }
    }
}

fn main() -> std::io::Result<()> {
    let input = fs::read_to_string("data/input.txt")?;
    let instructions = parse_instructions(&input);
    let mut dial = Dial { position: 50, zero_landings: 0, zero_passes: 0 };

    for instruction in instructions {
        dial.turn(instruction);
    }

    println!("Password: {}", dial.zero_landings + dial.zero_passes);
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
