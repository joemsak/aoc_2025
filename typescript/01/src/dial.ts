export default class Dial {
  private static readonly LIMIT = 100;

  position = 50;

  turn(dir: string, count: number) {
    const limitedCount = count % Dial.LIMIT;
    const delta = (dir === "L") ? -limitedCount : limitedCount;

    // remainder -> modulo in JS:
    //   - ((n % d) + d) % d
    const n = this.position + delta; // dividend
    const d = Dial.LIMIT;            // divisor
    const result = ((n % d) + d) % d

    this.position = result;
  }
}
