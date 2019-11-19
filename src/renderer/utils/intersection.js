export default function intersection(arrays, selector) {
  arrays = [...arrays];

  if (arrays.length === 0) { return []; }
  if (arrays.length === 1) { return [...arrays[0]]; }

  const smallestIndex = arrays.reduce(
    (sm, array, i) => (array.length < arrays[sm].length ? i : sm),
    0,
  );

  const [smallest] = arrays.splice(smallestIndex, 1);

  const sets = arrays.map(array => new Set(array.map(item => selector(item))));

  return smallest.filter(item => sets.every(set => set.has(selector(item))));
}
