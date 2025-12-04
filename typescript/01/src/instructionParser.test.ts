import {parseInstructions, Instruction} from './instructionParser';

describe('instructionParser module', () => {
  test('read a single instruction', () => {
    expected = [new Instruction("L", "32")]
    result = parseInstructions("L32")

    expect(result).toEqual(expected)
  });

  test('read multiple instructions', () => {
    expected = [
      new Instruction("L", "32"),
      new Instruction("R", "23"),
      new Instruction("R", "1"),
      new Instruction("L", "2")
    ]
    result = parseInstructions("L32\nR23,R1, L2")

    expect(result).toEqual(expected)
  });
});
