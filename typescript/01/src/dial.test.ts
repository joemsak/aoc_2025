import Dial from './dial';

describe('Dial', () => {
  test('initial conditions', () => {
    expect(new Dial().position).toBe(50)
  });
})
