import {readFileSync} from 'fs';
import Dial from "./dial";
import {parseInstructions} from "./instructionParser";

const dial = new Dial();
const instructions = readFileSync('input.txt', 'utf8');
const parsedInstructions = parseInstructions(instructions);

for (const { rotation, clicks } of parsedInstructions) {
  dial.turn(rotation, clicks);
}

console.log(dial.zeroPasses + dial.zeroLandings);
