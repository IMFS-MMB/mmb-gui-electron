export default function chunkArray(arr, size) {
  const chunks = [];

  for (let i = 0, l = arr.length; i < l; i += size) {
    chunks.push(arr.slice(i, i + size));
  }

  return chunks;
}
