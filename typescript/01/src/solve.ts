import {readFileSync} from 'fs';
import Dial from "./dial";
import {parseInstructions} from "./instructionParser";

const dial = new Dial();
const instructions = readFileSync('input.txt', 'utf8');
const parsedInstructions = parseInstructions(instructions);

let zeroPasses = 0;
let zeroLandings = 0;

for (let { rotation, clicks } of parsedInstructions) {
  while(clicks > 0) {
    dial.step(rotation)
    clicks--;
    if (clicks > 0 && dial.position === 0) zeroPasses++;
  };

  if (dial.position === 0) zeroLandings++;
}


console.log(zeroPasses + zeroLandings);
