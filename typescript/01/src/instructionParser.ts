export class Instruction {
  public rotation: string;
	public count: number;

  constructor(rotation: string, count: string) {
    this.rotation = rotation.toUpper();
    this.count = parseInt(count);
  }
}

export function parseInstructions(list: string): Instruction[] {
  return list.split(/[\n,]\s*/).map(entry => {
    const rotation = entry.split("")[0];
    const count = entry.substring(1);
    return new Instruction(rotation, count);
  });
}
