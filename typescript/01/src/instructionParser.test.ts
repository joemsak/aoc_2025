import {parseInstructions, Instruction} from './instructionParser';

describe('instructionParser module', () => {
  test('read a single instruction', () => {
    expected = new Instruction("L", "32")
    result = parseInstructions("L32")

    expect(result).toEqual([expected])
  });
});
