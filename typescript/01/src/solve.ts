import {readFileSync} from 'fs';
import Dial from "./dial";
import {parseInstructions} from "./instructionParser";

const dial = new Dial();
const instructions = readFileSync('input.txt', 'utf8');
const parsedInstructions = parseInstructions(instructions);

let counter = 0;

for (const { dir, count } of parsedInstructions) {
  dial.turn(dir, count);
  if (dial.position === 0) counter++
}

console.log("Landed on 0:", counter);
