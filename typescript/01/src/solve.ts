import {readFileSync} from 'fs';
import Dial from "./dial";
import {parseInstructions} from "./instructionParser";

const dial = new Dial();
const input = readFileSync('input.txt', 'utf8');
const instructions = parseInstructions(input);

let zeroPasses = 0;
let zeroLandings = 0;

for (const instruction of instructions) {
  let clicks = instruction.clicks;

  while(clicks > 0) {
    dial.step(instruction.rotation)
    clicks--;
    if (clicks > 0 && dial.position === 0) zeroPasses++;
  };

  if (dial.position === 0) zeroLandings++;
}

console.log(zeroPasses + zeroLandings);
