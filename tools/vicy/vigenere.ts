const maxChar = 126;
const minChar = 32;
const modValue = maxChar + 1 - minChar;

// to support negative numbers
const modX = (n: number, modulo: number) => {
  return ((n % modulo) + modulo) % modulo;
};

export const encrypt = (text: string, key: string) => {
  let result = "";

  for (let i = 0; i < text.length; i++) {
    const char = text[i];

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
  const shift = char.charCodeAt(0) - minChar;

  return shift;
};

const getCharCode = (char: string) => {
  return char.charCodeAt(0) - minChar;
};

const getStringFromCharCode = (code: number) => {
  return String.fromCharCode(code + minChar);
};

export const isValidKey = (key: string, keyConfirm: string) => {
  let isValid = key === keyConfirm && key.length > 1;

  for (const c of key) {
    if (c.charCodeAt(0) < minChar || c.charCodeAt(0) > maxChar) {
      isValid = false;
      return;
    }
  }

  return isValid;
};

export const isValidText = (text: string) => {
  let isValid = text.length > 0;

  for (const c of text) {
    if (c.charCodeAt(0) < minChar || c.charCodeAt(0) > maxChar) {
      isValid = false;
      return;
    }
  }

  return isValid;
};

// @ts-ignore
if (typeof window === "undefined") {
  const [mode, key, keyConfirm, textOrCipher] = process.argv.slice(2);
  if (!isValidKey(key, keyConfirm)) {
    console.log("Error: Invalid key");
    process.exit(1);
  }
  if (!isValidText(textOrCipher)) {
    console.log("Error: Invalid text or cipher");
    process.exit(1);
  }

  if (mode === "e") {
    console.log(encrypt(textOrCipher, key));
  } else if (mode === "d") {
    console.log(decrypt(textOrCipher, key));
  }
}
