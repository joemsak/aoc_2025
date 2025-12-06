export default class Dial {
  position = 50;
  zeroPasses = 0;
  zeroLandings = 0;

  step(rotation: string) {
    const delta = rotation === "L" ? -1 : 1;
    this.position += delta;
    if (this.position === -1) this.position = 99;
    if (this.position === 100) this.position = 0;
  };
};
