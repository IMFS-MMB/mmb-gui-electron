export default function parseOutput(json) {
  return JSON.parse(json, (key, value) => {
    switch (value) {
      case '_Inf_':
        return Infinity;
      default:
        return value;
    }
  });
}
