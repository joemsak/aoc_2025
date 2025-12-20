import Dial from "./dial";
import {parseInstructions} from "./instructionParser";

const dial = new Dial();
const instructions = "L5,R10,L3";
const parsedInstructions = parseInstructions(instructions);

for (const { dir, count } of parsedInstructions) {
  dial.turn(dir, count);
}

console.log("Final position:", dial.position);
