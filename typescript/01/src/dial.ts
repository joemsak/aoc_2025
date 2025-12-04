export default class Dial {
  position = 50;

  turn(dir: string, count: number) {
    const delta = (dir === "L") ? -count : count;
    this.position += delta;
  }
}
