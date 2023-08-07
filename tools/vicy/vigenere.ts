//const maxChar = 126;
//const minChar = 32;
//const modValue = maxChar + 1 - minChar;
//const blubb = (char: string) => char.charCodeAt(0);

const alphabet = "abcdefghijklmnopqrstuvwxyz";
const minChar = 0;
const maxChar = alphabet.length - 1;
const modValue = alphabet.length;
const blubb = (char: string) => alphabet.indexOf(char);

// to support negative numbers
const modX = (n: number, modulo: number) => {
  return ((n % modulo) + modulo) % modulo;
};

const LINE_BREAK = String.fromCharCode(10);
const isLineBreak = (char: string) => {
  return char.charCodeAt(0) === 10;
};

export const encrypt = (text: string, key: string) => {
  let result = "";

  for (let i = 0; i < text.length; i++) {
    const char = isLineBreak(text[i]) ? "$" : text[i];

    let newIndex = getCharCode(char) + getShiftForIndex(key, i);
    newIndex %= modValue;

    result += getStringFromCharCode(newIndex);
  }

  return result;
};

export const decrypt = (text: string, key: string) => {
  let result = "";

  for (let i = 0; i < text.length; i++) {
    const char = text[i];

    let newIndex = getCharCode(char) - getShiftForIndex(key, i);

    newIndex = modX(newIndex, modValue);

    result += getStringFromCharCode(newIndex);
  }

  return result;
};

const getShiftForIndex = (key: string, index: number) => {
  const char = key[index % key.length];
  const shift = blubb(char) - minChar;

  return shift;
};

const getCharCode = (char: string) => {
  return blubb(char) - minChar;
};

const getStringFromCharCode = (code: number) => {
  //return String.fromCharCode(code + minChar);
  return alphabet[code];
};

export const isValidKey = (key: string, keyConfirm: string) => {
  let isValid = key === keyConfirm && key.length > 1;

  for (const c of key) {
    if (blubb(c) < minChar || blubb(c) > maxChar) {
      isValid = false;
      return;
    }
  }

  return isValid;
};

export const isValidText = (text: string) => {
  let isValid = text.length > 0;

  for (const c of text) {
    if ((blubb(c) < minChar && !isLineBreak(c)) || blubb(c) > maxChar) {
      isValid = false;
      return;
    }
  }

  return isValid;
};
