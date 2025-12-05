export class Instruction {
  public rotation: string;
	public clicks: number;

  constructor(rotation: string, clicks: string) {
    this.rotation = rotation.toUpperCase();
    this.clicks = parseInt(clicks);
  }
}

export function parseInstructions(list: string): Instruction[] {
  return list.split(/[\n,]\s*/).map(entry => {
    const rotation = entry.split("")[0];
    const clicks = entry.substring(1);
    if (!rotation || !clicks) return;
    return new Instruction(rotation, clicks);
  }).filter(i => i !== null && i !== undefined);
}
