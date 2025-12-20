export class Instruction {
  public dir: string;
	public count: string;

  constructor(dir: string, count: string) {
    this.dir = dir;
    this.count = count;
  }
}

export function parseInstructions(list: string): Instruction[] {
  dir = list.split("")[0];
  count = list.substring(1);
	instruction = new Instruction(dir, count);

  return [instruction];
}
