export default class Dial {
  position = 50;
  zeroPasses = 0;
  zeroLandings = 0;

  turn(rotation: string, clicks: number) {
    const delta = rotation === "L" ? -1 : 1

    loop {
      this.position += delta;
      if (this.position === -1) this.position = 99;
      if (this.position === 100) this.position = 0;

      clicks--;
      break if clicks === 0;

      if (this.position === 0) this.zeroPasses++;
    };

    if (this.position === 0) this.zeroLandings++;
  };
};
