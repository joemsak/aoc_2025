import Dial from './dial';

describe('Dial', () => {
  test('initial conditions', () => {
    expect(new Dial().position).toBe(50)
  });

  test("turn the dial", () => {
    const dial = new Dial();

    dial.turn("L", 5);
    expect(dial.position).toBe(45);

    dial.turn("R", 10);
    expect(dial.position).toBe(55);
  });

  test("turn the dial past 0/99", () => {
    const dial = new Dial();

    dial.turn("L", 51);
    expect(dial.position).toBe(99);

    dial.turn("R", 2);
    expect(dial.position).toBe(1);
  });

  test("edge case: high number", () => {
    const dial = new Dial();
    dial.turn("L", 876);
    expect(dial.position).toBe(74);
  });
})
