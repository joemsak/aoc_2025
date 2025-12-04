import Dial from './dial';

describe('Dial', () => {
  test('initial conditions', () => {
    expect(new Dial().position).toBe(50)
  });

  test("turn the dial", () => {
    dial = new Dial();
    dial.turn("L", 5);
    expect(dial.position).toBe(45);
  });
})
