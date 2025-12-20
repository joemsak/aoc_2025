import Dial from './dial';

describe('Dial', () => {
  test('initial conditions', () => {
    expect(new Dial().position).toBe(50)
  });

  test("turn the dial", () => {
    const dial = new Dial();

    dial.step("L")
    expect(dial.position).toBe(49);

    dial.step("R")
    expect(dial.position).toBe(50);
  });

  test("turn the dial past 0/99", () => {
    const dial = new Dial();

    for(let i = 51; i > 0; i--) {
      dial.step("L")
    }
    expect(dial.position).toBe(99);

    dial.step("R")
    expect(dial.position).toBe(0);
  });
})
