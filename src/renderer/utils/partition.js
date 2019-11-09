export default function partition(array, predicate) {
  const trues = [];
  const falses = [];

  array.forEach(item => (predicate(item) ? trues : falses).push(item));

  return [trues, falses];
}
