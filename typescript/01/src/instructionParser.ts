export class Instruction {
  public dir: string;
	public count: number;

  constructor(dir: string, count: string) {
    this.dir = dir;
    this.count = parseInt(count);
  }
}

export function parseInstructions(list: string): Instruction[] {
  return list.split(/[\n,]\s*/).map(entry => {
    dir = entry.split("")[0];
    count = entry.substring(1);
    return new Instruction(dir, count);
  });
}
